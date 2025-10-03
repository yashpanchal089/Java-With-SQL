show databases;
create database db14;
use db14;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES
    (1, 'John', 'Doe', 60000.00, '2020-01-15'),
    (2, 'Jane', 'Smith', 65000.00, '2019-11-20'),
    (3, 'Mike', 'Johnson', 55000.00, '2021-03-10');

SELECT * FROM employees;

-- Basic column aliases:
SELECT first_name as 'First Name' FROM employees;

--  Creating full name using concatenation

select concat(first_name, " ", last_name) as 'Full name'from employees;

-- we cann as multiple aliias to rename the field
select  concat(first_name, " ", last_name)  as 'Full Name', salary*1.1 as 'New Salary' from employees;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
    (1, 'Engineering', 'New York'),
    (2, 'Marketing', 'Los Angeles'),
    (3, 'Finance', 'Chicago');
    
-- Add department reference to employees table

alter table employees 
add column departmet_id int;

select * from employees;

-- using table aliases
-- employees departments

select e.first_name , e.last_name,d.dept_name from employees e join departments d on e.departmet_id = d.dept_id;

-- alies in subquery
select avg(salary) as 'Average_Salary'from employees;

select avg_salary.Average_Salary
from (select avg(salary) as 'Average_Salary'from employees) as avg_salary;

-- we can use alias in case
select first_name,
	case
		when age< 18 then 'Minor'
		else 'adult'
	end as Age_Category
from student s;
