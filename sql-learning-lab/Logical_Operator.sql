/*Logical operators are used in SQL to filter records based on multiple conditions in the WHERE clause*/

show databases;
create database company_db;
use company_db;

create table employees(
emp_id int primary key auto_increment,
name VARCHAR(50),
age INT,
department VARCHAR(50),
salary DECIMAL(10,2),
city VARCHAR(50)
);

desc employees;

INSERT INTO employees (name, age, department, salary, city) VALUES
('Alice Johnson', 30, 'HR', 50000, 'New York'),
('Bob Smith', 25, 'IT', 70000, 'Los Angeles'),
('Charlie Brown', 35, 'IT', 80000, 'New York'),
('David Wilson', 40, 'Finance', 90000, 'Chicago'),
('Emily Davis', 28, 'HR', 48000, 'San Francisco'),
('Franklin Moore', 32, 'IT', 75000, 'Los Angeles'),
('Grace Adams', 45, 'Finance', 95000, 'Chicago');


select * from employees;

select * from employees where department = 'IT' and salary > 70000;

select * from employees where department = 'HR' or city = 'New York';

select * from employees where not department = 'Finance';

select * from employees where (department = 'IT' and salary > 70000)  or department = 'Finance';

select * from employees where not department = 'Finance' and city = 'Chicago';