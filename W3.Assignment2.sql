-- ======================================================
-- Assignment 2: Stdent record management system
-- Student name: Prajwal Agasimundina
-- ======================================================

-- ================== Part A : Theory ===================
-- 1. What is the difference between DATE and DATETIME?
-- DATE stores only the date in the format YYYY-MM-DD. It does not store time.
-- DATETIME stores both date and time in the format YYYY-MM-DD HH:MM:SS.
-- DATE is used when only date is needed, while DATETIME is used when both date and time are required.

-- 2. Why should email or phone number fields often be marked as UNIQUE?
-- Email and phone numbers are usually different for every person.
-- Using the UNIQUE constraint makes sure no two records have the same email or phone number.
-- This helps avoid duplicate data in the table.

-- 3.Can a table have multiple UNIQUE constraints? Explain.
-- Yes, a table can have multiple UNIQUE constraints.
-- Each column with a UNIQUE constraint must contain different values for every row.
-- For example, both email and phone_number can be UNIQUE in the same table.

-- 4.What happens if you try to insert a NULL value into a NOT NULL column?
-- The database will not allow the insertion.
-- It will show an error message because NOT NULL columns must always have a value.
-- So NULL values cannot be inserted in those columns.

-- 5.Why is proper data type selection important while designing tables?
-- Choosing the correct data type helps to store data efficiently.
-- It also improves performance and accuracy of the database.
-- For example, dates should be stored in DATE format and numbers in numeric types.



-- =========================== Part B ==============================
create database student_db;
show databases;
use student_db;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number BIGINT,
    course VARCHAR(30),
    date_of_birth DATE,
    registration_date DATETIME
);
insert into students values
(1,'Rahul Kumar','rahul@gmail.com',9876543210,'Data Science','2002-05-14','2024-01-10 10:30:00'),
(2,'Priya Sharma','priya@gmail.com',9876543211,'AI','2001-09-20','2024-01-11 11:00:00'),
(3,'Arjun Reddy','arjun@gmail.com',9876543212,'Cyber Security','2002-03-12','2024-01-12 09:45:00'),
(4,'Sneha Patel','sneha@gmail.com',9876543213,'Web Development','2001-12-05','2024-01-13 02:15:00'),
(5,'Kiran Kumar','kiran@gmail.com',9876543214,'Cloud Computing','2002-07-18','2024-01-14 04:20:00');

select * from students;
describe students;
drop database student_db;


