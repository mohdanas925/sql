CREATE DATABASE dsmp;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
	name VARCHAR(20),
	age INT,
	email VARCHAR(50)
)
USE dsmp;

INSERT INTO student VALUES
(1, 'anas', 20, 'anas@gmail.com'),
(2, 'alice', 18, 'alice@gmail.com'),
(3, 'bob', 22, 'bob@gmail.com');

SELECT * FROM student;

CREATE DATABASE IF NOT EXISTS campusx;

DROP DATABASE IF EXISTS campusx;

USE campusx;

CREATE TABLE users (
	user_id INT PRIMARY KEY,
    name VARCHAR(20),
    email VARCHAR(255),
    password VARCHAR(20)
)

SELECT * FROM users;

INSERT INTO users (user_id, name, email, password) VALUES
(1, 'Aman', 'aman123@gmail.com', 'pass123'),
(2, 'Riya', 'riya45@gmail.com', 'riya@123'),
(3, 'Karan', 'karan.dev@gmail.com', 'karan321'),
(4, 'Sneha', 'sneha.me@gmail.com', 'sneha@22'),
(5, 'Rahul', 'rahul99@gmail.com', 'rahul#99'),
(6, 'Neha', 'neha12@gmail.com', 'neha@456'),
(7, 'Arjun', 'arjun007@gmail.com', 'bond007'),
(8, 'Priya', 'priya.k@gmail.com', 'priya789'),
(9, 'Vikas', 'vikas.tech@gmail.com', 'vikas@1'),
(10, 'Anjali', 'anjali@gmail.com', 'anjali123');


TRUNCATE TABLE users;
SELECT * FROM users;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    password VARCHAR(20)
)

SELECT * FROM users;

INSERT INTO users VALUES
(1, 'Aman', 'aman123@gmail.com', 'pass123');

CREATE TABLE users (
	user_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(255)  NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL
);

INSERT INTO users VALUES
(1, 'Aman', 'aman123@gmail.com', 'pass123');

INSERT INTO users (user_id, name, email, password) VALUES
(2, 'Anas', 'aman123@gmail.com', 'anas123');

CREATE TABLE users (
	user_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(255)  NOT NULL,
    password VARCHAR(20) NOT NULL,
    
    CONSTRAINT users_email_unique UNIQUE (name, email)   -- combination of name and email will be unique
);

ALTER TABLE users DROP CONSTRAINT users_email_unique;

SELECT * FROM users;

INSERT INTO users VALUES
(3, 'Aman', 'aman123@gmail.com', 'amas123');


CREATE TABLE user1 (
	user_id INT,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(255)  NOT NULL,
    password VARCHAR(20) NOT NULL,
    
    CONSTRAINT user1_email_unique UNIQUE (name, email),
    CONSTRAINT user1_userid_pk PRIMARY KEY (user_id)
);

INSERT INTO user1 VALUES
(3, 'Aman', 'aman123@gmail.com', 'amas123');

SELECT * FROM user1;

