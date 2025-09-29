# 📘 SQL – SELECT Command

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Select+All+Columns;Where+Clause;Order+By;Limit;Distinct;Functions;Group+By;Union)](https://git.io/typing-svg)


---

## 📌 Introduction
The `SELECT` statement in SQL is used to retrieve data from a database.  
The `SELECT` statement is the most commonly used command in Structured Query Language. 
It is used to access the records from one or more database tables and views. 
It also retrieves the selected data that follow the conditions we want.
It allows you to:
- Choose specific columns  
- Apply filters with conditions (`WHERE`)  
- Sort and limit results (`ORDER BY`, `LIMIT`)  
- Use functions (`AVG`, `ROUND`, `YEAR`, etc.)  
- Combine queries (`UNION`, subqueries, `GROUP BY`)  

In this example, we use an **employees** table inside the `company` database.

---

## 1. **SELECT Command**

- **Basic Syntax**  
```sql
SELECT column1, column2, ... 
FROM table_name;
```
Select all columns
```
SELECT * FROM table_name;
```

Use AS for readability (aliases)
```
SELECT first_name AS 'First Name', last_name AS 'Last Name' FROM employees;
```

Filter with WHERE
```
SELECT * FROM employees WHERE department = 'IT';
```

Limit results
```
SELECT * FROM employees LIMIT 2;
```

Order results
```
SELECT * FROM employees ORDER BY salary DESC;
```

Select specific column only
```
SELECT department FROM employees;
```

Find unique values
```
SELECT DISTINCT department FROM employees;
```

Salary increase example (calculation)
```
SELECT first_name, last_name, salary*1.1 AS 'Salary after raise' FROM employees;
```

Merge two columns with CONCAT
```
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name' FROM employees;
```

Useful functions
```
YEAR(hire_date)     -- Extract year from date
ROUND(salary, 1)    -- Round salary to 1 decimal
AVG(salary)         -- Average salary
```

Subquery example
```
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);
```

UNION (merge results of two queries)
```
SELECT first_name, last_name FROM employees WHERE department='IT'
UNION
SELECT first_name, last_name FROM employees WHERE department='HR';
```

Group by function
```
SELECT COUNT(*), department FROM employees GROUP BY department;
```

Extra functions
```
SELECT 2+2;   -- Answer is 4
SELECT NOW(); -- Current date & time
```

---

## 2. **SQL Code Example**
```
/* Create company database and employees table */

SHOW DATABASES;
CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- Insert employee data
INSERT INTO employees (first_name, last_name, department, salary, hire_date)
VALUES 
('John', 'Dak', 'IT', 60000.00, '2022-05-19'),
('alex', 'who', 'sales', 90000.00, '2024-03-22'),
('array', 'Dak', 'HR', 9000.00, '2021-01-23'),
('kat', 'mane', 'IT', 60660.00, '2025-09-30'),
('san', 'kit', 'HR', 6005000.00, '2014-04-09');

-- Select all data
SELECT * FROM employees;

-- Aliases for readability
SELECT first_name AS 'First Name', last_name AS 'Last Name', department AS 'Department' 
FROM employees;

-- Where condition
SELECT * FROM employees WHERE department = 'IT';

-- Order by salary (ascending)
SELECT * FROM employees WHERE department = 'IT' ORDER BY salary ASC;

-- Top 2 salaries (descending order)
SELECT * FROM employees ORDER BY salary DESC LIMIT 2;

-- Unique values
SELECT DISTINCT department FROM employees;

-- Salary raise example
SELECT first_name, last_name, salary*1.1 AS 'Salary after raise' FROM employees;

-- Full name and functions
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name', YEAR(hire_date), ROUND(salary, 1) 
FROM employees 
WHERE salary > 70000;

-- Average salary
SELECT AVG(salary) FROM employees;

-- Subquery
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Union
SELECT first_name, last_name FROM employees WHERE department='IT'
UNION
SELECT first_name, last_name FROM employees WHERE department='HR';

-- Group by
SELECT COUNT(*), department FROM employees GROUP BY department;

-- Extra functions
SELECT 2+2;
SELECT NOW();

```

---

## 3. **Cheat Sheet (Quick Summary)**

| Keyword / Function | Usage                      |
| ------------------ | -------------------------- |
| `SELECT *`         | Select all columns         |
| `AS`               | Rename column (alias)      |
| `WHERE`            | Filter results             |
| `ORDER BY`         | Sort results (ASC/DESC)    |
| `LIMIT`            | Restrict number of rows    |
| `DISTINCT`         | Unique values only         |
| `CONCAT()`         | Merge multiple columns     |
| `ROUND()`          | Round numbers              |
| `AVG()`            | Calculate average          |
| `YEAR(date)`       | Extract year               |
| `UNION`            | Combine results of queries |
| `GROUP BY`         | Group data by column       |
| `NOW()`            | Current date & time        |
