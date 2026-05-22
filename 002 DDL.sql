CREATE TABLE user2 (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(255)  NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL
);

USE campusx;

INSERT INTO user2 (name, email, password) VALUES
('Aman', 'aman123@gmail.com', 'pass123'),
('Riya', 'riya45@gmail.com', 'riya@123'),
('Karan', 'karan.dev@gmail.com', 'karan321');

SELECT * FROM user2;

CREATE TABLE students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT, -- CHECK (age > 6 AND age < 25)
    
    CONSTRAINT student_age_check CHECK (age > 6 AND age < 25)
);

INSERT INTO students (name, age) VALUES
('Anas', 21),
('Rahul', 19),
('Priya', 22),
('Amit', 18),
('Neha', 20);

SELECT * FROM students;

INSERT INTO students (name, age) VALUES
('Anas', 5);

CREATE TABLE ticket(
	ticked_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    travel_date DATE DEFAULT (CURRENT_DATE)
);
INSERT INTO ticket (ticked_id, name) VALUES
(1, 'Anas'),
(2, 'Rahul'),
(3, 'Priya');

SELECT * FROM ticket;
INSERT INTO ticket VALUES (4, 'Amit', '2026-04-15');

DROP TABLE ticket;

CREATE TABLE ticket(
	ticked_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    travel_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers(
	cid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    cid INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT order_fk FOREIGN KEY (cid) REFERENCES customers (cid)
);

DROP TABLE orders;
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    cid INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT order_fk FOREIGN KEY (cid) REFERENCES customers (cid)
    
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    cid INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT order_fk FOREIGN KEY (cid) REFERENCES customers (cid)
    
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    cid INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT order_fk FOREIGN KEY (cid) REFERENCES customers (cid)
    
    ON DELETE SET NULL
    ON UPDATE SET NULL
    -- SET NULL requires the column to allow NULL values.
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cid INT DEFAULT 1,
    
    FOREIGN KEY (cid)
    REFERENCES customers(cid)
    ON DELETE SET DEFAULT
);

SELECT * FROM customers;
DROP TABLE customers;

ALTER TABLE customers
ADD COLUMN surname VARCHAR(50) NOT NULL AFTER name;

ALTER TABLE customers
ADD COLUMN pan_number VARCHAR(20) AFTER surname,
ADD COLUMN joining_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE customers
DROP COLUMN pan_number;

ALTER TABLE customers
ADD COLUMN age INT;

ALTER TABLE customers
DROP COLUMN joining_date,
DROP COLUMN surname;

ALTER TABLE customers
MODIFY COLUMN name INT NOT NULL;

ALTER TABLE customers
CHANGE name full_name VARCHAR(50);

ALTER TABLE customers
ADD CONSTRAINT check_age CHECK (age > 6 AND age < 25);

ALTER TABLE customers
DROP CONSTRAINT check_age;
ALTER TABLE customers
ADD CONSTRAINT check_age CHECK (age > 6 AND age < 35);