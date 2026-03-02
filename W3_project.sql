CREATE DATABASE student_course_db;

USE student_course_db;

CREATE TABLE student(
 student_id INT PRIMARY KEY,
 full_name VARCHAR(50) NOT NULL, 
 email VARCHAR(100) UNIQUE NOT NULL,
 phone_number BIGINT UNIQUE,
 course_name VARCHAR(30),
 date_of_birth DATE,
 registration_date DATETIME
);

INSERT INTO student VALUES
(1,'Prajwal A','prajwal01@gmail.com',8123456701,'Cloud Computing','2003-04-12','2025-01-15 09:30:00'),
(2,'Rohan S','rohan.s02@gmail.com',8234567812,'Cyber Security','2002-11-23','2024-12-20 10:45:00'),
(3,'Sneha K','sneha.k03@gmail.com',8345678923,'Machine Learning','2004-02-18','2026-02-10 14:20:00'),
(4,'Darshan P','darshan.p04@gmail.com',8456789034,'Artificial Intelligence','2003-07-09','2025-06-05 11:00:00'),
(5,'Pooja M','pooja.m05@gmail.com',8567890145,'Business Analytics','2004-01-30','2026-03-12 16:10:00'),
(6,'Vikas T','vikas.t06@gmail.com',8678901256,'DevOps','2003-05-21','2025-09-01 13:25:00'),
(7,'Shreya N','shreya.n07@gmail.com',8789012367,'UI UX Design','2002-08-14','2024-08-18 09:15:00'),
(8,'Kiran H','kiran.h08@gmail.com',8890123478,'Mobile App Development','2003-12-03','2025-04-22 15:40:00'),
(9,'Harshita V','harshita.v09@gmail.com',8901234589,'Digital Marketing','2004-06-27','2026-01-08 10:05:00'),
(10,'Abhishek L','abhishek.l10@gmail.com',9012345690,'Python Programming','2003-09-11','2025-07-19 12:50:00'),
(11,'Divya S','divya.s11@gmail.com',9123456702,'SQL Database','2004-03-05','2026-02-28 08:45:00'),
(12,'Nikhil R','nikhil.r12@gmail.com',9234567813,'Full Stack Web Development','2002-10-17','2024-11-09 17:20:00'),
(13,'Tejaswini B','tejaswini.b13@gmail.com',9345678924,'Data Engineering','2003-01-25','2025-05-14 09:55:00'),
(14,'Akshay D','akshay.d14@gmail.com',9456789035,'Blockchain Technology','2002-06-19','2024-10-30 11:35:00'),
(15,'Priyanka G','priyanka.g15@gmail.com',9567890146,'Software Testing','2004-04-08','2026-03-02 14:00:00'),
(16,'Rahul M','rahul.m16@gmail.com',9678901257,'Embedded Systems','2003-02-13','2025-02-16 16:45:00'),
(17,'Neha C','neha.c17@gmail.com',9789012368,'Internet of Things','2002-09-29','2024-07-12 13:10:00'),
(18,'Siddharth K','siddharth.k18@gmail.com',9890123479,'Big Data Analytics','2003-11-07','2025-12-01 10:25:00'),
(19,'Ananya P','ananya.p19@gmail.com',9901234580,'React Development','2004-05-16','2026-01-20 15:15:00'),
(20,'Yash W','yash.w20@gmail.com',9812345691,'Advanced Java','2003-08-22','2025-08-27 09:40:00');

select * from student;