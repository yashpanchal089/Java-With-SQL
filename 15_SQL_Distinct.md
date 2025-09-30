
# 📘 SQL – DISTINCT Clause
[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=FF5733&width=600&lines=SQL+DISTINCT;Remove+Duplicates;Unique+Values;Count+Unique;Sorting+Distinct)](https://git.io/typing-svg)

---

## 📌 Introduction
- The `DISTINCT` keyword in SQL is used to **remove duplicate records** from the result set.
- It helps retrieve **unique values** from one or more columns.
- `DISTINCT` can be used with `SELECT`, combined with `COUNT`, `ORDER BY`, or conditional queries.

---

## 1. **Basic Syntax**

```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```
- DISTINCT filters out duplicate rows based on the selected column(s).
- Multiple columns can be used to identify duplicates more precisely.
  
## 2. SQL Code Examples
```
-- Create database and use it
SHOW DATABASES;
CREATE DATABASE employeeDB;
USE employeeDB;

-- Create employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert sample data (including duplicates)
INSERT INTO employees (name, department, salary) VALUES
    ('Alice', 'HR', 50000),
    ('Bob', 'Finance', 60000),
    ('Charlie', 'IT', 70000),
    ('Alice', 'HR', 50000),      -- Duplicate record
    ('David', 'Finance', 55000),
    ('Eve', 'IT', 70000),        -- Duplicate salary
    ('Frank', 'HR', 50000);      -- Duplicate department & salary

-- View all records
SELECT * FROM employees;
```

## 3. Using DISTINCT on Single Column
```
-- Retrieve unique departments
SELECT DISTINCT department FROM employees;
```

## 4. Using DISTINCT on Multiple Columns
```
-- Retrieve unique department + salary combinations
SELECT DISTINCT department, salary FROM employees;

-- Count unique departments
SELECT COUNT(DISTINCT department) AS unique_department FROM employees;

-- Retrieve distinct salary values sorted descending
SELECT DISTINCT salary FROM employees ORDER BY salary DESC;

-- Distinct names with department
SELECT DISTINCT name, department FROM employees;

-- Filter distinct values using WHERE
SELECT DISTINCT department FROM employees WHERE salary > 50000;
```
## 5. Handling NULL values with DISTINCT
```
-- Insert records with NULL departments
INSERT INTO employees (name, department, salary) VALUES 
    ('Grace', NULL, 48000),
    ('Bobby', NULL, 48000);

-- Retrieve distinct departments including NULL
SELECT DISTINCT department FROM employees;

```
**⚡ Note: DISTINCT treats NULL as a unique value.**

## ✅ Key Takeaways
- DISTINCT is used to remove duplicate rows in a query result.
- Can be applied to single or multiple columns.
- Works with COUNT() to find the number of unique entries.
- Sorting can be applied to DISTINCT results using ORDER BY.
- NULL values are considered distinct.
