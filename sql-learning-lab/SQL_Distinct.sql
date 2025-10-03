show databases;
create database employeeDB;
use employeeDB;

-- Create employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert sample data including duplicates
INSERT INTO employees (name, department, salary) VALUES
    ('Alice', 'HR', 50000),
    ('Bob', 'Finance', 60000),
    ('Charlie', 'IT', 70000),
    ('Alice', 'HR', 50000),      -- Duplicate record
    ('David', 'Finance', 55000),
    ('Eve', 'IT', 70000),        -- Duplicate salary
    ('Frank', 'HR', 50000);      -- Duplicate department & salary
    
    
select * from employees;

-- using distinct on a single column

select distinct department from employees;

-- using distinct on a multiple column

select distinct department, salary from employees;

-- using distinct with count o find unique values

select count(distinct department)  as unique_department from employees;

-- get distinct salary values sorted in descending order

select distinct salary from employees order by salary desc;

select distinct name, department from employees;

select distinct department from employees where salary> 50000;

-- Handling NULL values with DISTINCT
-- Insert records with NULL departments
INSERT INTO employees (name, department, salary) VALUES 
    ('Grace', NULL, 48000),
    ('Bobby', NULL, 48000);

select distinct department from employees;

-- here distinct count as null as unique value