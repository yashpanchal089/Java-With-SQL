# SQL DELETE Tutorial
[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=FF0000&lines=SQL+DELETE+%F0%9F%92%80;Remove+Records;WHERE+Clause;CASCADE+DELETE;TRUNCATE+Table;Auto-Increment+Behavior)](https://git.io/typing-svg)

This tutorial demonstrates how to **remove records** from a database table using SQL `DELETE` and `TRUNCATE`.  

---

## 1. Database and Table Setup

```sql
CREATE DATABASE delete_tutorial;
USE delete_tutorial;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO products VALUES 
(1, 'Laptop', 999.99, 10),
(2, 'Smartphone', 499.99, 25),
(3, 'Headphones', 89.99, 50),
(4, 'Tablet', 349.99, 15),
(5, 'Keyboard', 59.99, 30),
(6, 'Mouse', 29.99, 45),
(7, 'Monitor', 249.99, 12),
(8, 'Printer', 179.99, 8),
(9, 'External Hard Drive', 129.99, 20),
(10, 'USB Drive', 19.99, 100);

SELECT * FROM products;
```

## 2. Basic DELETE Syntax
```sql
Delete a specific record by ID
DELETE FROM products WHERE product_id = 10;

-- Delete records based on a condition
DELETE FROM products WHERE price < 50.00;

-- Delete all records in a table
DELETE FROM products;
```

**Notes:**
- `WHERE` clause is crucial; without it, all rows are removed.
- Safe update mode may restrict deletes without a primary key.

## 3. Foreign Key Constraints and DELETE
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES (1, 2, 3);

-- Attempting to delete a referenced product fails
DELETE FROM products WHERE product_id = 2;
-- Error: Foreign key constraint prevents deletion
```

**Using CASCADE**
```sql
ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON DELETE CASCADE;

-- Now deletion will also remove dependent orders
DELETE FROM products WHERE product_id = 2;
```

**Using SET NULL**
```sql
ALTER TABLE orders
DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON DELETE SET NULL;

DELETE FROM products WHERE product_id = 3;
```

**Notes:**
- CASCADE: deletes related rows automatically.
- SET NULL: sets foreign key column to NULL when parent row is deleted.

## 4. Auto-Increment Behavior with DELETE
```sql
CREATE TABLE auto_example (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO auto_example (name) VALUES ('Item 1'), ('Item 2'), ('Item 3');

DELETE FROM auto_example;

INSERT INTO auto_example (name) VALUES ('New Item');

SELECT * FROM auto_example;
```

**Notes:**
- DELETE does not reset the auto-increment counter.
- New inserts continue from the last counter.

## 5. TRUNCATE TABLE
```sql
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, email, hire_date, salary) VALUES
('John Doe', 'john.doe@example.com', '2023-01-15', 65000.00),
('Jane Smith', 'jane.smith@example.com', '2023-02-20', 72000.00),
('Michael Brown', 'michael.brown@example.com', '2023-03-10', 58000.00);

-- Remove all employees quickly
TRUNCATE TABLE employees;

SELECT * FROM employees;
```

**Notes:**
- TRUNCATE is faster than DELETE for removing all rows.
- Resets auto-increment counters.
- Cannot use WHERE clause with TRUNCATE.
- Does not fire triggers, unlike DELETE.

## 6. Key Differences: DELETE vs TRUNCATE
| Feature                | DELETE              | TRUNCATE             |
| ---------------------- | ------------------- | -------------------- |
| Command Type           | DML                 | DDL                  |
| WHERE Clause           | Supported           | Not Supported        |
| Trigger Activation     | Yes                 | No                   |
| Auto-increment Counter | Preserved           | Reset                |
| Rollback               | Yes                 | Usually No           |
| Speed                  | Slower (row by row) | Faster (table reset) |

## 7. Summary
- Use DELETE to remove specific records using a WHERE clause.
- Use CASCADE or SET NULL to handle foreign key constraints.
- TRUNCATE is ideal for removing all rows efficiently.
- Understand differences in logging, triggers, and auto-increment behavior.

