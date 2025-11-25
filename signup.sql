-- CREATE TABLE IF NOT EXISTS signup (
--     Customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     full_name TEXT NOT NULL,
--     email TEXT NOT NULL UNIQUE,
--     cell_number TEXT NOT NULL UNIQUE,
--     residential_address TEXT NOT NULL,
--     password TEXT NOT NULL UNIQUE
-- );

-- INSERT into signup (full_name, email, cell_number, residential_address, password) 
-- VALUES ('Tshepo Choene','Tshepochoene14@gmail.com','0694034979','Pretoria','tshepo1224'),
--        ('Thabang Matlou','Thabangmatlou32@gmail.com','0694044979','Cape Town','thabang114'),
--        ('Musa Mthombeni','Musamthombeni41@gmail.com','0694054979','Pretoria','musa145'),
--        ('Tshepang Masingiti','Tshepangmasingiti12@gmail.com','0694064979','Joburg','tshepang1234'),
--        ('Lebogang Leisa','Lebogangleisa24@gmail.com','0694074979','Joburg','lebogang1445'),
--        ('Lesego Matome','Lesegomatome11@gmail.com','0694084979','Pretoria','lesego1344'),
--        ('Lerato Moloi','Leratomoloi32@gmail.com','0624094979','Cape Town','lerato1234!'),
--        ('Tshego Shona','Tshegoshona47@gmail.com','0623014979','Pretoria','tshego41!'),
--        ('Monique Du plessis','Moniquedp12@gmail.com','0623024979','Joburg','monique44!'),
--        ('Lucas Vasquez','Lucasvasquez23@gmail.com','0624044979','Cape Town','lucasvasq10!')
--        ;

-- Query to view all signup data
SELECT * FROM signup;

-- Utility queries (uncomment when needed)
-- DELETE FROM signup;
-- DELETE FROM signup WHERE Customer_id=1;

-- PRAGMA foreign_keys = ON;
-- CREATE TABLE IF NOT EXISTS queries (
--     query_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     Customer_id INTEGER NOT NULL,
--     full_name TEXT NOT NULL,
--     email TEXT NOT NULL,
--     cell_number TEXT NOT NULL,
--     problem_description TEXT NOT NULL,
--     details TEXT NOT NULL,
--     FOREIGN KEY (Customer_id) REFERENCES signup(Customer_id)
-- );

-- CREATE TABLE IF NOT EXISTS timeseek (
--     time Text PRIMARY KEY NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS dayofmonth (
--     day INTEGER PRIMARY KEY NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS slot (
--     slot_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     Customer_id INTEGER NOT NULL,
--     day INTEGER NOT NULL,
--     time TEXT NOT NULL,
--     FOREIGN KEY (Customer_id) REFERENCES signup(Customer_id),
--     FOREIGN KEY (day) REFERENCES dayofmonth(day),
--     FOREIGN KEY (time) REFERENCES timeseek(time)
-- );

-- CREATE TABLE IF NOT EXISTS tracklaundry (
--     laundry_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     Customer_id INTEGER NOT NULL,
--     FOREIGN KEY (Customer_id) REFERENCES signup(Customer_id)
-- );

-- Sample queries for other tables
-- SELECT * FROM queries;
-- SELECT * FROM timeseek;
-- SELECT * FROM dayofmonth;
-- SELECT * FROM slot;
-- SELECT * FROM tracklaundry;