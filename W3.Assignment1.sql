-- ==================================================
---- Week 3 Assignment -1 -----
---- Assignment 1: Database Fundamentals
---- Student Name : Prajwal Agasimundina
-- ==================================================
-- ================= Part A : Therory =================

-- 1. What is a database in MySQL?Why is it important?
-- A database in MySQL is a collection of related data stored in tables.
-- It helps to store, manage, and retrieve data easily.
-- Organizing data into databases keeps information structured, secure, and easy to access.

-- 2. Explain the difference between INT and BIGINT. When would you prefer one over the other?
-- INT is used to store smaller integer numbers.
-- BIGINT is used to store very large integer values.
-- INT is used for normal numbers like employee IDs, while BIGINT is used when the numbers are very large, like big financial records.

-- 3. What is a PRIMARY KEY? Mention two rules that a primary key must follow.
-- A PRIMARY KEY is a column that uniquely identifies each record in a table.
-- Rules:
-- The value cannot be NULL.
-- The value must be unique for every row.

-- 4. Differentiate between CHAR and VARCHAR with one practical example.
-- CHAR stores fixed-length data, while VARCHAR stores variable-length data.
-- CHAR always uses the full space given, but VARCHAR only uses the space needed.
-- Example: If we store “IT” in CHAR(10), it still uses 10 characters, but VARCHAR(10) uses only 2 characters.

-- 5.What is the purpose of NOT NULL and UNIQUE constraints?
-- NOT NULL makes sure that a column cannot have empty values. 
-- UNIQUE makes sure that all values in the column are different. 
-- These constraints help keep the data correct and avoid duplicates.


-- ============================== PART B =================================
create database company_db;
show databases;
use company_db;
create table employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department CHAR(10),
    salary INT,
    joining_date DATE,
    created_at DATETIME
);
INSERT INTO employees VALUES
(1,'Prajwal','prajwal@gmail.com','HR',30000,'2023-01-10','2023-01-10 10:30:00'),
(2,'Meghana','meghana@gmail.com','Finance',35000,'2023-02-15','2023-02-15 11:00:00'),
(3,'Rakshitha','rakshitha@gmail.com','IT',40000,'2023-03-20','2023-03-20 09:45:00'),
(4,'Krishna','krishna@gmail.com','Admin',28000,'2023-04-05','2023-04-05 02:15:00'),
(5,'Niveditha','niveditha@gmail.com','Sales',32000,'2023-05-12','2023-05-12 04:20:00');

select * from employees;
describe employees;
drop table employees;
drop database company_db; 



