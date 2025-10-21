CREATE TABLE IF NOT EXISTS signup (
    Customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    cell_number TEXT NOT NULL UNIQUE,
    residential_address TEXT NOT NULL,
    password TEXT NOT NULL
);

--INSERT into signup (full_name, email, cell_number, residential_address, password) 
--VALUES ('Kithi','banzavilla@gmail.com','0694024979','Pretoria','kithi1234');
--SELECT * FROM signup;
--DELETE FROM signup WHERE Customer_id=1;

PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS queries (
    query_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Customer_id INTEGER NOT NULL,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL,
    cell_number TEXT NOT NULL,
    problem_description TEXT NOT NULL,
    details TEXT NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES signup(Customer_id)
);

--INSERT into queries (Customer_id, full_name, email, cell_number, problem_description, details) 
--VALUES (1, 'Kithi', 'banzavilla@gamil.com', '0694024979', 'Login Issue', 'Unable to login with correct credentials');
--SELECT * FROM queries;
--DELETE FROM queries WHERE query_id=1;

CREATE TABLE IF NOT EXISTS timeseek (
    time Text PRIMARY KEY NOT NULL
);

--INSERT into timeseek (time) 
--VALUES ('08:00'), ('10:00'), ('12:00'), ('14:00'),
       --('16:00');
--SELECT * FROM timeseek;

CREATE TABLE IF NOT EXISTS dayofmonth (
    day INTEGER PRIMARY KEY NOT NULL
);

--INSERT into dayofmonth (day) 
--VALUES ('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),
--('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('20'),
--('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('30'),('31');
--SELECT * FROM dayofmonth;

CREATE TABLE IF NOT EXISTS slot (
    slot_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Customer_id INTEGER NOT NULL,
    day INTEGER NOT NULL,
    time TEXT NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES signup(Customer_id),
    FOREIGN KEY (day) REFERENCES dayofmonth(day),
    FOREIGN KEY (time) REFERENCES timeseek(time)
);

CREATE TABLE IF NOT EXISTS tracklaundry (
    laundry_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Customer_id INTEGER NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES signup(Customer_id)
);