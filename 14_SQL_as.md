# 📘 SQL Alias as

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Alias:+Column+Alias;Table+Alias;Expression+Alias;Subquery+Alias;CASE+Alias)](https://git.io/typing-svg)

---

## 🔹 1. Alias in SQL
Aliases are **temporary names** assigned to database tables, columns, or expressions to make them more **readable** and **meaningful**.  
They are mainly used with the `AS` keyword.

### ✅ Key Points:
- Column aliases → rename columns in output.
- Table aliases → shorten table names in queries.
- Expression aliases → rename calculated fields.
- Subquery aliases → reference derived tables.
- CASE expressions → alias output for clarity.

---

## 🔹 2. SQL Setup & Sample Data

```sql
-- Create database
CREATE DATABASE db14;
USE db14;

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- Insert sample data
INSERT INTO employees VALUES
    (1, 'John', 'Doe', 60000.00, '2020-01-15'),
    (2, 'Jane', 'Smith', 65000.00, '2019-11-20'),
    (3, 'Mike', 'Johnson', 55000.00, '2021-03-10');

-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
    (1, 'Engineering', 'New York'),
    (2, 'Marketing', 'Los Angeles'),
    (3, 'Finance', 'Chicago');
```

## 🔹 3. Column Aliases
```
-- Basic column alias
SELECT first_name AS 'First Name'
FROM employees;
-- Concatenate full name with alias
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name'
FROM employees;

-- Multiple aliases: full name & new salary
SELECT  
    CONCAT(first_name, ' ', last_name) AS 'Full Name', 
    salary * 1.1 AS 'New Salary'
FROM employees;
```
## 🔹 4. Table Aliases

```
-- Add department reference
ALTER TABLE employees 
ADD COLUMN departmet_id INT;

-- Using table alias for readability
SELECT e.first_name, e.last_name, d.dept_name
FROM employees e 
JOIN departments d ON e.departmet_id = d.dept_id;
```
## 🔹 5. Alias in Subquery

```
-- Alias on aggregate
SELECT AVG(salary) AS 'Average_Salary'
FROM employees;

-- Subquery alias
SELECT avg_salary.Average_Salary
FROM (
    SELECT AVG(salary) AS 'Average_Salary'
    FROM employees
) AS avg_salary;
```
## 🔹 6. Alias in CASE Expression

```
-- Alias used in CASE expression
SELECT first_name,
    CASE
        WHEN age < 18 THEN 'Minor'
        ELSE 'Adult'
    END AS Age_Category
FROM student s;
```
---
## ✅ Key Takeaways

- `AS` is used to create temporary names (aliases).
- Aliases improve query readability.
- Can be applied to columns, tables, subqueries, and CASE expressions.
