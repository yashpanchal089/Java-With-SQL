-- when working with large datasets, we often need to summaruze data
CREATE DATABASE db_for_group_by;
USE db_for_group_by;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees (name, department, salary, joining_date) VALUES
('Alice', 'HR', 50000, '2020-06-15'),
('Bob', 'HR', 55000, '2019-08-20'),
('Charlie', 'IT', 70000, '2018-03-25'),
('David', 'IT', 72000, '2017-07-10'),
('Eve', 'IT', 73000, '2021-02-15'),
('Frank', 'Finance', 60000, '2020-11-05'),
('Grace', 'Finance', 65000, '2019-05-30'),
('Hannah', 'Finance', 62000, '2021-01-12');

INSERT INTO employees (name, department, salary, joining_date) VALUES
('Tim', 'HR', 65000, '2019-05-30'),
('Tom', 'IT', 62000, '2021-01-12');

SELECT * FROM employees;

-- Count Employees in Each Department
select department, count(*)  from employees group by department;

-- Example 2: Get the Average Salary Per Department

select avg(salary), department from employees group by department;

-- Example 3: Get the Highest and Lowest Salary Per Department

select department, min(salary), max(salary) from employees group by department;

-- Example 4: Count Employees Per Department and Joining Year

select department, year(joining_date), count(*) 
from employees 
group by department, year(joining_date);

-- Example 5: Order Departments by the Highest Average Salary

select department, avg(salary) FROM employees group by department order by avg(salary) desc;

-- Example 6: Group by Calculated Salary Range
select
case
when salary <= 60000 then 'Low Salary'
when salary between 60000 and 70000 then 'Medium salary'
else ' High salart'
end as salary_range, count(*) as employee_count
from employees
group by salary_range;

-- Example 7: Find Department with the Maximum Number of Employees
select department, count(*) as emp_count from employees group by department order by  emp_count desc limit 1;

-- Example 8: Find Departments With More Than 2 Employees (With Conditions)
select department, count(*) as emp_count from employees where joining_date > '2019-01-01' group by department having emp_count > 2 ;