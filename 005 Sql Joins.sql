USE campusx;

DROP TABLE users3;

CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

-- Customers
INSERT INTO customers1 VALUES
(1, 'Anas'),
(2, 'Rahul'),
(3, 'Sara'),
(4, 'John');

-- Products
INSERT INTO products VALUES
(101, 'Laptop'),
(102, 'Mobile'),
(103, 'Tablet'),
(104, 'Camera');

-- Orders
INSERT INTO orders VALUES
(1001, 1, 101),
(1002, 2, 102),
(1003, 1, 103),
(1004, 5, 104); -- customer_id 5 does NOT exist


SELECT * FROM customers1;
SELECT * FROM orders;
SELECT * FROM products;

-- CROSS JOIN
SELECT * FROM customers1 AS t1
CROSS JOIN products AS t2; 


-- INNER JOIN
SELECT * FROM customers1 c
INNER JOIN orders o 
ON c.customer_id = o.customer_id
INNER JOIN products p 
ON o.product_id = p.product_id;

-- LEFT JOIN
SELECT c.name, o.order_id
FROM customers1 c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT c.name, o.order_id
FROM customers1 c
RIGHT JOIN orders o 
ON c.customer_id = o.customer_id;

-- Full JOIN
SELECT c.name, o.order_id
FROM customers1 c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.name, o.order_id
FROM customers1 c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;



-- SET OPERATIONS
CREATE TABLE person1 (
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE person2 (
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

INSERT INTO person2 (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO person1 (id, name) VALUES
(3, 'Charlie'),
(4, 'David'),
(5, 'Emly');
 -- UNION
SELECT * FROM person2
UNION
SELECT * FROM person1;

-- UNION ALL (contains duplicates)
SELECT * FROM person2
UNION ALL
SELECT * FROM person1;

-- INTERSECTION and EXCEPT is not applicable in MySql
-- INTERSECT with INNER JOIN or IN 
SELECT * FROM person2
WHERE id IN (
    SELECT id FROM person1
);


-- EXCEPT using NOT IN (A - B)
SELECT * FROM person2
WHERE id NOT IN (
    SELECT id FROM person1
);


-- SELF JOIN
CREATE TABLE users3(
	user_id INT PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    emergency_contact INT NOT NULL
);

INSERT INTO users3 (user_id, name, age, emergency_contact) VALUES
(1, 'Nitish', 34, 11),
(2, 'Ankit', 32, 1),
(3, 'Neha', 23, 1),
(4, 'Radhika', 34, 3),
(8, 'Abhinav', 31, 11),
(11, 'Rahul', 29, 8);

SELECT * FROM users3;

-- SELF JOIN
SELECT * FROM users3 t1
JOIN users3 t2
ON t1.emergency_contact = t2.user_id;


-- Joining on more than one cols
CREATE TABLE students (
	student_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    class_id INT NOT NULL,
    enroll_year INT NOT NULL
);

CREATE TABLE class(
	class_id INT PRIMARY KEY,
    class_name VARCHAR(15) NOT NULL,
    teacher VARCHAR(20) NOT NULL,
    enroll_year INT NOT NULL
);

DROP TABLE class;

INSERT INTO students VALUES
(1, 'John', 'Smith', 1, 2021),
(2, 'Jane', 'Doe', 2, 2020),
(3, 'Bob', 'Johnson', 1, 2021),
(4, 'Sally', 'Brown', 3, 2022),
(5, 'Tom', 'Williams', 2, 2022),
(6, 'Alice', 'Davis', 4, 2020);

INSERT INTO class VALUES
(1, 'Maths 101', 'Mr. Smith', 2021),
(2, 'English 1', 'Ms. Johnson', 2021),
(3, 'Science 1', 'Dr. Lee', 2022),
(4, 'History 1', 'Ms. Williams', 2022);

SELECT * FROM students;
SELECT * FROM class;

SELECT * FROM students t1
JOIN class t2
ON t1.class_id = t2.class_id
AND t1.enroll_year = t2.enroll_year;


CREATE DATABASE flipkart;
USE flipkart;

SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM category;

-- find order name and corresponding category name
SELECT * FROM orders t1
JOIN order_details t2
ON t1.order_id = t2.order_id
JOIN category t3
ON t2.category_id = t3.category_id;


-- Find user_id, name and city from users and orders
SELECT t1.user_id, t1.name, t1.city FROM users t1
JOIN orders t2
ON t1.user_id = t2.user_id;


-- Find order_id, product_category from order_details and category
SELECT t2.order_id, t1.category FROM category t1
JOIN order_details t2
ON t1.category_id = t2.category_id;

-- Find all orders placed in pune
SELECT * FROM orders t1
JOIN users t2
ON t1.user_id = t2.user_id
WHERE T2.city = 'Pune';

-- Find all profitable orders
SELECT t1.order_id, SUM(profit) AS profit
FROM orders t1
JOIN order_details t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id
HAVING profit > 1;


-- Find customer who placed max orders
SELECT name, COUNT(*) AS total_orders
FROM orders t1
JOIN users t2
ON t1.user_id = t2.user_id
GROUP BY name
ORDER BY total_orders DESC
LIMIT 1;

-- Most profitable categroy
SELECT vertical, COUNT(*),
SUM(profit) as profits
FROM category as t1
JOIN order_details t2
ON t1.category_id = t2.category_id
GROUP BY vertical
ORDER BY profits DESC
LIMIT 5;


-- Most profitable state
SELECT state, COUNT(*),
SUM(profit) AS profits 
FROM users t1
JOIN orders t2
ON t1.user_id = t2.user_id
JOIN order_details t3
ON t2.order_id = t3.order_id
GROUP BY state
ORDER BY profits DESC
LIMIT 5;

-- All categories with profit higher than 5000
SELECT vertical, SUM(profit) AS profits
FROM order_details t1
JOIN category t2
ON t1.category_id = t2.category_id
GROUP BY vertical
HAVING profits > 4000
