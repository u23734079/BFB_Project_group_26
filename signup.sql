CREATE TABLE IF NOT EXISTS signup (
    Customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    cell_number TEXT NOT NULL UNIQUE,
    residential_address TEXT NOT NULL,
    password TEXT NOT NULL UNIQUE
);

INSERT into signup (full_name, email, cell_number, residential_address, password) 
VALUES ('Tshepo Choene','Tshepochoene14@gmail.com','0694034979','Pretoria','tshepo1224'),
       ('Thabang Matlou','Thabangmatlou32@gmail.com','0694044979','Cape Town','thabang114'),
       ('Musa Mthombeni','Musamthombeni41@gmail.com','0694054979','Pretoria','musa145'),
       ('Tshepang Masingiti','Tshepangmasingiti12@gmail.com','0694064979','Joburg','tshepang1234'),
       ('Lebogang Leisa','Lebogangleisa24@gmail.com','0694074979','Joburg','lebogang1445'),
       ('Lesego Matome','Lesegomatome11@gmail.com','0694084979','Pretoria','lesego1344'),
       ('Lerato Moloi','Leratomoloi32@gmail.com','0624094979','Cape Town','lerato1234!'),
       ('Tshego Shona','Tshegoshona47@gmail.com','0623014979','Pretoria','tshego41!'),
       ('Monique Du plessis','Moniquedp12@gmail.com','0623024979','Joburg','monique44!'),
       ('Lucas Vasquez','Lucasvasquez23@gmail.com','0624044979','Cape Town','lucasvasq10!')
       ;
SELECT * FROM signup;
DELETE FROM signup;
DELETE FROM signup WHERE Customer_id=1;

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
--VALUES (3, 'Musa Mthombeni', 'Musamthombeni41@gmail.com', '0694054979', 'Login Issue', 'Unable to login with correct credentials'),
       --(1, 'Tshepo Choene', 'Tshepochoene14@gmail.com', '0694064979', 'Booking Issue', 'Unable to book a slot'),
       --(3, 'Musa Mthombeni', 'Musamthombeni41@gmail.com', '0694054979', 'Booking Issue', 'Unable to book a slot')
--;
--SELECT * FROM queries;
--DELETE FROM queries;

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

PRAGMA foreign_keys = OFF;
--INSERT into slot (Customer_id, day, time) 
--VALUES (2, 5, '10:00'),
       --(4, 12, '14:00'),
       --(5, 20, '08:00');
--SELECT * FROM slot;
--DELETE FROM slot;

PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS tracklaundry (
    laundry_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Customer_id INTEGER NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES signup(Customer_id)
);

--INSERT into tracklaundry (Customer_id) 
--VALUES (2), (4), (5);
--SELECT * FROM tracklaundry;