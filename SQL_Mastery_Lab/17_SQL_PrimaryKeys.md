# SQL `GROUP BY` and `HAVING` Clause 📝

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=GROUP+BY;COUNT+%26+AVG;MIN+%2F+MAX;Multiple+Grouping;CASE+Grouping;HAVING)](https://git.io/typing-svg)


When working with **large datasets**, we often need to **summarize and analyze data** instead of working with individual rows.  
This is where **GROUP BY** and **HAVING** clauses are very useful.

---

## 🔹 `GROUP BY` Clause
- The `GROUP BY` clause groups rows that have the same values into **summary rows**.  
- Often used with **aggregate functions** (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).  
- Helps to calculate statistics per category.

**Syntax:**
```sql
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name;
```

## 🔹 `HAVING` Clause
- Similar to WHERE, but used with aggregated/grouped results.
- WHERE filters rows before grouping, while HAVING filters groups after aggregation.
  
**Syntax:**
```
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

## 🚨 Interview asked question: 
   -  Wanna filter before grouping? Use `WHERE` 🔍.
   -  Try it after grouping without `HAVING` 😱💥… and watch chaos unfold! ⚠️
---

## 📂 SQL Practice File with Notes
```
-- Create database
CREATE DATABASE db_for_group_by;
USE db_for_group_by;

-- Create employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

-- Insert sample data
INSERT INTO employees (name, department, salary, joining_date) VALUES
('Alice', 'HR', 50000, '2020-06-15'),
('Bob', 'HR', 55000, '2019-08-20'),
('Charlie', 'IT', 70000, '2018-03-25'),
('David', 'IT', 72000, '2017-07-10'),
('Eve', 'IT', 73000, '2021-02-15'),
('Frank', 'Finance', 60000, '2020-11-05'),
('Grace', 'Finance', 65000, '2019-05-30'),
('Hannah', 'Finance', 62000, '2021-01-12'),
('Tim', 'HR', 65000, '2019-05-30'),
('Tom', 'IT', 62000, '2021-01-12');

-- View all data
SELECT * FROM employees;

------------------------------------------------------
-- Example 1: Count Employees in Each Department
------------------------------------------------------
SELECT department, COUNT(*)  
FROM employees 
GROUP BY department;

-- Groups by department and counts employees in each.

------------------------------------------------------
-- Example 2: Get the Average Salary Per Department
------------------------------------------------------
SELECT department, AVG(salary) 
FROM employees 
GROUP BY department;

-- Groups by department and calculates average salary.

------------------------------------------------------
-- Example 3: Get the Highest and Lowest Salary Per Department
------------------------------------------------------
SELECT department, MIN(salary), MAX(salary) 
FROM employees 
GROUP BY department;

-- Shows salary range for each department.

------------------------------------------------------
-- Example 4: Count Employees Per Department and Joining Year
------------------------------------------------------
SELECT department, YEAR(joining_date), COUNT(*) 
FROM employees 
GROUP BY department, YEAR(joining_date);

-- Multiple grouping: by department and year of joining.

------------------------------------------------------
-- Example 5: Order Departments by the Highest Average Salary
------------------------------------------------------
SELECT department, AVG(salary) 
FROM employees 
GROUP BY department 
ORDER BY AVG(salary) DESC;

-- Departments with higher average salary come first.

------------------------------------------------------
-- Example 6: Group by Calculated Salary Range
------------------------------------------------------
SELECT
  CASE
    WHEN salary <= 60000 THEN 'Low Salary'
    WHEN salary BETWEEN 60000 AND 70000 THEN 'Medium Salary'
    ELSE 'High Salary'
  END AS salary_range, 
  COUNT(*) AS employee_count
FROM employees
GROUP BY salary_range;

-- Custom grouping using CASE.

------------------------------------------------------
-- Example 7: Find Department with the Maximum Number of Employees
------------------------------------------------------
SELECT department, COUNT(*) AS emp_count 
FROM employees 
GROUP BY department 
ORDER BY emp_count DESC 
LIMIT 1;

-- Finds department with the largest employee count.

------------------------------------------------------
-- Example 8: Find Departments With More Than 3 Employees (HAVING)
------------------------------------------------------
SELECT department, COUNT(*) AS emp_count 
FROM employees 
GROUP BY department 
HAVING emp_count > 3;

-- HAVING filters groups after aggregation.
```
---
## ✅ Key Takeaways

- GROUP BY → Groups rows based on column values.
- HAVING → Filters groups (used after aggregation).
