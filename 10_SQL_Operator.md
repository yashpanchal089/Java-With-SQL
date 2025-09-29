# 📘 SQL – Logical Operators

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Logical+Operators;Comparison+Operators;Arithmetic+Operators;SQL+Queries)](https://git.io/typing-svg)


---

## 📌 Introduction
- Logical operators in SQL allow you to **filter records based on multiple conditions** in the `WHERE` clause.  
- They are essential for creating complex queries that combine multiple criteria.
- Every database administrator and user uses SQL queries for manipulating and accessing the data of database tables and views.
The manipulation and retrieving of the data are performed with the help of reserved words and characters, 
which are used to perform arithmetic operations, logical operations, comparison operations, compound operations, etc.



---

## 1. **Logical Operators – Notes**

| Operator | Description |
|----------|-------------|
| `AND`    | Returns records where **both conditions are TRUE** |
| `OR`     | Returns records where **at least one condition is TRUE** |
| `NOT`    | Negates a condition (returns the **opposite result**) |

- Logical operators are typically used in the `WHERE` clause.  
- Parentheses `()` can be used to **group conditions** and control precedence.

---

## 2. **SQL Code Examples**

```sql
-- Create database and table
SHOW DATABASES;
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- View table structure
DESC employees;

-- Insert data into employees table
INSERT INTO employees (name, age, department, salary, city) VALUES
('Alice Johnson', 30, 'HR', 50000, 'New York'),
('Bob Smith', 25, 'IT', 70000, 'Los Angeles'),
('Charlie Brown', 35, 'IT', 80000, 'New York'),
('David Wilson', 40, 'Finance', 90000, 'Chicago'),
('Emily Davis', 28, 'HR', 48000, 'San Francisco'),
('Franklin Moore', 32, 'IT', 75000, 'Los Angeles'),
('Grace Adams', 45, 'Finance', 95000, 'Chicago');
```

- Logical Operators

1. Write a query to retrieve all records from the employees table.
```
SELECT * FROM employees;
```

- AND operator
2. Find all employees who work in the IT department and have a salary greater than 70,000.
```
SELECT * FROM employees WHERE department = 'IT' AND salary > 70000;
```

- OR operator
3. List all employees who are in the HR department or are located in New York.
```
SELECT * FROM employees WHERE department = 'HR' OR city = 'New York';
```


- NOT operator
3. Find all employees who are not in the Finance department.
```
SELECT * FROM employees WHERE NOT department = 'Finance';
```

- Combining AND and OR
4. Retrieve employees who are either in the IT department with a salary greater than 70,000 or are in the Finance department.
```
SELECT * FROM employees 
WHERE (department = 'IT' AND salary > 70000) OR department = 'Finance';
```

- Combining NOT with AND
5. Find employees who are not in the Finance department and are located in Chicago.
```
SELECT * FROM employees 
WHERE NOT department = 'Finance' AND city = 'Chicago';
```

## 3. **SQL Operators Cheat Sheet**

## 🔢 1. Arithmetic Operators
Perform basic mathematical operations on numeric data.

| Operator | Description | Example |
|----------|-------------|---------|
| `+`      | Addition    | `SELECT price + 10 FROM products;` |
| `-`      | Subtraction | `SELECT price - 5 FROM products;` |
| `*`      | Multiplication | `SELECT price * 2 FROM products;` |
| `/`      | Division    | `SELECT price / 2 FROM products;` |
| `%`      | Modulo (Remainder) | `SELECT price % 2 FROM products;` |

---

## 🔍 2. Comparison Operators
Compare two values and return a boolean result.

| Operator | Description | Example |
|----------|-------------|---------|
| `=`      | Equal to    | `SELECT * FROM employees WHERE age = 30;` |
| `!=` or `<>` | Not equal to | `SELECT * FROM employees WHERE age != 30;` |
| `<`      | Less than   | `SELECT * FROM employees WHERE age < 30;` |
| `>`      | Greater than | `SELECT * FROM employees WHERE age > 30;` |
| `<=`     | Less than or equal to | `SELECT * FROM employees WHERE age <= 30;` |
| `>=`     | Greater than or equal to | `SELECT * FROM employees WHERE age >= 30;` |

---

## 🧠 3. Logical Operators
Combine multiple conditions in a `WHERE` clause.

| Operator | Description | Example |
|----------|-------------|---------|
| `AND`    | Both conditions must be true | `SELECT * FROM employees WHERE age > 30 AND department = 'IT';` |
| `OR`     | At least one condition must be true | `SELECT * FROM employees WHERE age > 30 OR department = 'IT';` |
| `NOT`    | Negates a condition | `SELECT * FROM employees WHERE NOT department = 'HR';` |

---

## 🧮 4. Bitwise Operators
Operate on bits and perform bit-by-bit operations.

| Operator | Description | Example |
|----------|-------------|---------|
| `&`      | Bitwise AND | `SELECT id & 1 FROM users;` |
| `|`      | Bitwise OR  | `SELECT id | 1 FROM users;` |
| `^`      | Bitwise XOR | `SELECT id ^ 1 FROM users;` |
| `~`      | Bitwise NOT | `SELECT ~id FROM users;` |
| `<<`     | Left shift  | `SELECT id << 1 FROM users;` |
| `>>`     | Right shift | `SELECT id >> 1 FROM users;` |

---

## ➕ 5. Compound Operators
Simplify assignments by combining an operator with assignment.

| Operator | Description | Example |
|----------|-------------|---------|
| `+=`     | Add and assign | `UPDATE accounts SET balance += 100 WHERE id = 1;` |
| `-=`     | Subtract and assign | `UPDATE accounts SET balance -= 50 WHERE id = 1;` |
| `*=`     | Multiply and assign | `UPDATE accounts SET balance *= 2 WHERE id = 1;` |
| `/=`     | Divide and assign | `UPDATE accounts SET balance /= 2 WHERE id = 1;` |
| `%=`     | Modulo and assign | `UPDATE accounts SET balance %= 3 WHERE id = 1;` |

---

## 🧾 6. Special Operators
Perform specialized operations.

| Operator | Description | Example |
|----------|-------------|---------|
| `BETWEEN`| Range check | `SELECT * FROM products WHERE price BETWEEN 10 AND 20;` |
| `IN`     | Multiple values | `SELECT * FROM products WHERE category IN ('Electronics', 'Furniture');` |
| `LIKE`   | Pattern matching | `SELECT * FROM products WHERE name LIKE 'A%';` |
| `IS NULL`| Null value check | `SELECT * FROM products WHERE description IS NULL;` |
| `EXISTS` | Subquery check | `SELECT * FROM employees WHERE EXISTS (SELECT * FROM departments WHERE id = employees.department_id);` |

---

## 🧩 7. Set Operators
Combine results from multiple `SELECT` queries.

| Operator | Description | Example |
|----------|-------------|---------|
| `UNION`  | Combine results and remove duplicates | `SELECT name FROM employees UNION SELECT name FROM contractors;` |
| `UNION ALL` | Combine results and include duplicates | `SELECT name FROM employees UNION ALL SELECT name FROM contractors;` |
| `INTERSECT` | Return common records | `SELECT name FROM employees INTERSECT SELECT name FROM contractors;` |
| `EXCEPT`  | Return records from the first query not in the second | `SELECT name FROM employees EXCEPT SELECT name FROM contractors;` |

---

## 🧪 8. Unary Operators
Operate on a single operand.

| Operator | Description | Example |
|----------|-------------|---------|
| `+`      | Unary plus  | `SELECT +age FROM employees;` |
| `-`      | Unary minus | `SELECT -age FROM employees;` |
| `NOT`    | Negation    | `SELECT NOT is_active FROM users;` |

---

## 📌 9. Assignment Operators
Assign values to variables.

| Operator | Description | Example |
|----------|-------------|---------|
| `=`      | Assign value | `SET @total = 100;` |

---

## 🧵 10. String Operators
Manipulate string data.

| Operator | Description | Example |
|----------|-------------|---------|
| `||`     | Concatenate strings | `SELECT first_name || ' ' || last_name AS full_name FROM employees;` |
| `CONCAT` | Concatenate strings (MySQL) | `SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;` |

---

## 🧠 11. NULL-Safe Equality Operator
Compare values considering `NULL` values.

| Operator | Description | Example |
|----------|-------------|---------|
| `<=>`    | NULL-safe equal to | `SELECT * FROM users WHERE email <=> 'example@example.com';` |

---

## 🧾 12. Membership Operators
Check if a value matches a list of values.

| Operator | Description | Example |
|----------|-------------|---------|
| `ANY`    | Compare to any value in a subquery | `SELECT * FROM products WHERE price > ANY (SELECT price FROM products WHERE category = 'Electronics');` |
| `ALL`    | Compare to all values in a subquery | `SELECT * FROM products WHERE price > ALL (SELECT price FROM products WHERE category = 'Electronics');` |

---

## 🧩 13. Conditional Operators
Perform conditional operations.

| Operator | Description | Example |
|----------|-------------|---------|
| `CASE`   | Conditional expression | `SELECT name, CASE WHEN age >= 18 THEN 'Adult' ELSE 'Minor' END AS status FROM users;` |
| `COALESCE` | Return first non-NULL value | `SELECT COALESCE(phone, 'N/A') FROM contacts;` |
| `NULLIF` | Return NULL if two expressions are equal | `SELECT NULLIF(age, 0) FROM users;` |

---

## 🧪 14. Aggregate Operators
Perform calculations on a set of values.

| Operator | Description | Example |
|----------|-------------|---------|
| `COUNT`  | Count rows | `SELECT COUNT(*) FROM employees;` |
| `SUM`    | Sum values | `SELECT SUM(salary) FROM employees;` |
| `AVG`    | Average value | `SELECT AVG(salary) FROM employees;` |
| `MIN`    | Minimum value | `SELECT MIN(salary) FROM employees;` |
| `MAX`    | Maximum value | `SELECT MAX(salary) FROM employees;` |

---

## 🧩 15. Window Functions
Perform calculations across a set of table rows related to the current row.

| Function | Description | Example |
|----------|-------------|---------|
| `ROW_NUMBER()` | Assign a unique number to each row | `SELECT name, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank FROM employees;` |
| `RANK()` | Assign a rank to each row | `SELECT name, RANK() OVER (ORDER BY salary DESC) AS rank FROM employees;` |
| `DENSE_RANK()` | Assign a rank to each row without gaps | `SELECT name, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank FROM employees;` |
| `NTILE(n)` | Distribute rows into `n` buckets | `SELECT name, NTILE(4) OVER (ORDER BY salary DESC) AS quartile FROM employees;` |
| `LEAD()` | Access data from the next row | `SELECT name, LEAD(salary, 1) OVER (ORDER BY salary DESC) AS next_salary FROM employees;` |
| `LAG()`  | Access data from the previous row | `SELECT name, LAG(salary, 1) OVER (ORDER BY salary DESC) AS prev_salary FROM employees;` |

---

## 🧠 16. JSON Operators
Operate on JSON data types.

| Operator | Description | Example |
|----------|-------------|---------|
| `->`     | Get JSON object field | `SELECT data->'name' FROM users;` |
| `->>`    | Get JSON object field as text | `SELECT data->>'name' FROM users;` |
| `#>>`    | Get JSON object field with path | `SELECT data#>>'{address, city}' FROM users;` |

---

## 🧾 17. Full-Text Search Operators
Perform full-text searches.

| Operator | Description | Example |
|----------|-------------|---------|
| `MATCH`  | Full-text search | `SELECT * FROM articles WHERE MATCH(title, content) AGAINST('SQL operators');` |
| `AGAINST`| Full-text search condition | `SELECT * FROM articles WHERE MATCH(title, content) AGAINST('SQL operators');` |

---

## 🧩 18. XML Operators
Operate on XML data types.

| Operator | Description | Example |
|----------|-------------|---------|
| `XMLTYPE` | Create XML data type | `SELECT XMLTYPE('<user><name>John</name></user>') FROM dual;` |
| `EXTRACTVALUE` | Extract value from XML | `SELECT EXTRACTVALUE(xml_column, '/user
::contentReference[oaicite:0]{index=0}
 

