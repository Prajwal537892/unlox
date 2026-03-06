-- Create a database

create database feb_batch;

-- Drop a database

drop database feb_batch;

-- to show all the database

show databases;

-- To enter into a database

use feb_batch;

-- How to create a table

create table students (
id int primary key,
s_name varchar(100),
marks int
);

drop table employee;

create table employee (
emp_id int primary key,
name varchar(100),
department varchar(100),
salary int,
age int
);




-- ======================Third session-=====================================
use feb_batch;
show tables;

select * from employee;
select * from Students;

insert into employee (emp_id, name, department, salary, age)
values(1, "AAA", "HR", 500000,34),
(2, "BBB", "HR", 600000,45),
(3, "CCC", "IT", 550000,38),
(4, "DDD", "Finance", 670000,42),
(5, "EEE", "IT", 880000,40),
(6, "FFF", "HR", 700000,28),
(7, "GGG", "IT", 400000,30);

select * from employee where department = "HR";
select  * from employee where salary > 500000 or "HR";


-- End of the day






-- Question: Calculate the salary for department where
select department,sum(salary) from employeee
group by department
order by su,(salary) desc;


select department,sum(salary) from employeee
where department = "HR"
group by department
order by su,(salary) desc;

-- count the students whose marks are more than 75.alter
select count(*) from students
where marks > 75;


-- question
create table patments (
payment_id int primary key,
payment_type varchar(100),
amount int
);
 



-- find the average amount for each payment type, print


create table payments (
payment_id int primary key,
payment_type varchar(100),
amount int 
);
 

insert into payments values 
(1, "CASH", 25000),
(2, "CASH", 50000),
(3, "UPI", 25000),
(4, "CASH", 80000),
(5, "UPI", 46000),
(6, "UPI", 34000),
(7, "CASH", 46000),
(8, "UPI", 65000),
(9, "CASH", 85000),
(10, "UPI", 95000),
(11, "UPI", 55000),
(12, "UPI", 35000),
(13, "CASH", 55000),
(14, "UPI", 75000),
(15, "UPI", 90000);


-- find the average salary amount for each
select payment_type, avg(amount) from payments
group by payment_type
order by avg(amount) desc;

select payment_type, avg(amount) from payments
group by payment_type
order by avg(amount) asc;


select payment_type, min(amount) from payments
group by payment_type
order by min(amount) desc;

select payment_type, max(amount) from payments
group by payment_type
order by max(amount) desc;

select payment_type, round(avg(amount),2) from payments
group by payment_type
order by avg(amount) desc;

-- print all the students whose name 's' start with
select s_name from students 
where s_name like "s%";

insert into students (id, s_name, marks)
values(1, "AAA", 76),
(2, "BBB", 77),
(3, "CCC", 80),
(4, "DDD", 87),
(5, "EEE", 78),
(6, "FFF", 66),
(7, "GGG", 79);

select * from students;

-- print all the students name starts with a

select s_name from students
where  s_name like "a%";

select s_name from students
where  s_name like "a%a";

select s_name from students
where  s_name like "_a%";


-- ==================== 4th session ==================
use feb_batch; 
show tables;
select * from dim_customer;
select * from dim_date;
select * from dim_host;
select * from dim_property;
select * from students;
select * from employee;

-- how to insert the null values in the table

insert into students values 
(1, "jancy", Null),
(2, "nancy", Null),
(3, Null, 99),
(4, Null, Null);

-- print the all the entries without having name  
select * from students
where s_name is null;   

insert into employee values
(10, NUll, "hr",  Null, 34),
(12, "BBN", Null, 400000, 35),
(13, "HDY","finance", Null);


-- print the all the entries without having name
select * from students
where s_name is null;


-- =========================5th session =======================================
use feb_batch;
show tables;

select * from dim_customer;
select * from dim_date;
select * from dim_host;
select * from dim_property;
select * from fact_bookings;

select Superhost_flag, round(sum(revenue),2) as Total_revenue from dim_host as dh
join fact_bookings as fb on fb.Host_ID = dh.Host_ID
group by dh.Superhost_Flag;












