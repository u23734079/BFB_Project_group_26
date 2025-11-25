from flask import Flask, render_template, request, redirect, url_for, session, flash
import sqlite3
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = 'your-secret-key-here-change-this'  # Change this to a random secret key

# Database helper function
def get_db_connection():
    con = sqlite3.connect('signup1.db')
    con.row_factory = sqlite3.Row
    return con

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        # Get form data
        full_name = request.form.get('fullname')
        email = request.form.get('email')
        cell_number = request.form.get('cell')
        residential_address = request.form.get('address')
        password = request.form.get('password')
        confirm_password = request.form.get('confirm')
        
        # Validation
        if not all([full_name, email, cell_number, residential_address, password, confirm_password]):
            flash('All fields are required!', 'error')
            return render_template('signup.html')
        
        if password != confirm_password:
            flash('Passwords do not match!', 'error')
            return render_template('signup.html')
        
        # Check if user already exists
        con = get_db_connection()
        cur = con.cursor()
        
        existing_user = cur.execute(
            'SELECT * FROM signup WHERE email = ? OR cell_number = ?',
            (email, cell_number)
        ).fetchone()
        
        if existing_user:
            flash('Email or cell number already registered!', 'error')
            con.close()
            return render_template('signup.html')
        
        # Insert new user
        try:
            cur.execute('''
                INSERT INTO signup (full_name, email, cell_number, residential_address, password)
                VALUES (?, ?, ?, ?, ?)
            ''', (full_name, email, cell_number, residential_address, password))
            con.commit()
            con.close()
            
            flash('Account created successfully! Please login.', 'success')
            return redirect(url_for('login'))
        except sqlite3.IntegrityError:
            flash('An error occurred. Please try again.', 'error')
            con.close()
            return render_template('signup.html')
    
    return render_template('signup.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('username')  # HTML uses 'username' for email field
        password = request.form.get('password')
        
        if not email or not password:
            flash('Please enter both email and password!', 'error')
            return render_template('login.html')
        
        # Check credentials
        con = get_db_connection()
        cur = con.cursor()
        
        user = cur.execute(
            'SELECT * FROM signup WHERE email = ? AND password = ?',
            (email, password)
        ).fetchone()
        
        con.close()
        
        if user:
            # Store user info in session
            session['user_id'] = user['Customer_id']
            session['user_name'] = user['full_name']
            session['user_email'] = user['email']
            
            flash(f'Welcome back, {user["full_name"]}!', 'success')
            return redirect(url_for('dashboard'))
        else:
            flash('Invalid email or password. Please try again.', 'error')
            return render_template('login.html')
    
    return render_template('login.html')

@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        flash('Please login to access dashboard.', 'error')
        return redirect(url_for('login'))
    
    # Get user bookings and laundry status
    con = get_db_connection()
    cur = con.cursor()
    
    # Get user's slots
    slots = cur.execute('''
        SELECT slot_id, day, time FROM slot 
        WHERE Customer_id = ?
        ORDER BY day, time
    ''', (session['user_id'],)).fetchall()
    
    # Get user's laundry tracking
    laundry = cur.execute('''
        SELECT laundry_id FROM tracklaundry 
        WHERE Customer_id = ?
    ''', (session['user_id'],)).fetchall()
    
    con.close()
    
    return render_template('dashboard.html', 
                         user_name=session['user_name'],
                         slots=slots,
                         laundry=laundry)

@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out successfully.', 'success')
    return redirect(url_for('home'))

# Optional: Route to view all users (admin)
@app.route('/users')
def users():
    con = get_db_connection()
    cur = con.cursor()
    all_users = cur.execute('SELECT * FROM signup').fetchall()
    con.close()
    return render_template('users.html', users=all_users)

if __name__ == '__main__':
    app.run(debug=True)