# 📘 SQL - REPLACE INTO Statement
[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=FF5733&lines=SQL+REPLACE+INTO+🛠;Insert+or+Update+Records;Delete+and+Re-Insert;Simplify+Data+Management)](https://git.io/typing-svg)
---

- `REPLACE INTO` is a special SQL command (mainly in MySQL, MariaDB) that works like a combination of **INSERT and DELETE:**
- If the record with the same **PRIMARY KEY** or **UNIQUE KEY** exists → it is **deleted** and the new row is inserted.
- If it doesn’t exist → it simply **inserts** the new record.
- This helps in **updating** or **inserting** in one step.

 ## 📝 Syntax
```sql
REPLACE INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```
- Works like INSERT, but replaces existing rows with matching primary/unique key.

## 🔹 Step 1: Setup Database & Table
```sql
CREATE DATABASE replace_demo;
USE replace_demo;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```
## 🔹 Step 2: Insert Sample Data
```sql
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (1, 'Laptop', 'Electronics', 899.99, 25),
    (2, 'Smartphone', 'Electronics', 599.99, 50),
    (3, 'Coffee Maker', 'Kitchen', 79.99, 30),
    (4, 'Running Shoes', 'Sportswear', 129.99, 40),
    (5, 'Desk Chair', 'Furniture', 189.99, 15);
```

## 🔹 Step 3: Replace an Existing Product
```sql
-- Replace product with ID 5
REPLACE INTO products (product_id, product_name, category, price, stock_quantity)
VALUES
    (5, 'Mic', 'Electronics', 500, 12);
```

**👉 This deletes old row (Desk Chair) and inserts new row (Mic).**

## 🔹 Step 4: Insert New Record with REPLACE
```sql
REPLACE INTO products (product_id, product_name, category, price)
VALUES
    (6, 'Camera', 'Electronics', 5000);
```

**👉 Since ID 6 didn’t exist before → this works like INSERT.**

## 🔹 Step 5: Bulk REPLACE Using Another Table
```sql
CREATE TABLE products2 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    supplier VARCHAR(100)
);

INSERT INTO products2 (product_id, product_name, category, price, stock_quantity, supplier)
VALUES 
    (2, 'Ultra Smartphone', 'Electronics', 899.99, 40, 'TechCorp'),
    (4, 'Pro Running Shoes', 'Sportswear', 149.99, 35, 'SportMaster'),
    (7, 'Bluetooth Speaker', 'Electronics', 79.99, 60, 'SoundWave'),
    (8, 'Gaming Mouse', 'Computer Accessories', 49.99, 100, 'GamerZone'),
    (9, 'Portable Monitor', 'Electronics', 199.99, 25, 'DisplayTech');
```

**Now, bulk replace:**
```sql
REPLACE INTO products (product_id, product_name, category, price, stock_quantity)
SELECT product_id, product_name, category, price, stock_quantity 
FROM products2;
```
**👉 Updates IDs 2, 4 and inserts new 7, 8, 9.**
--- 
## ✅ Key Notes

- REPLACE INTO deletes the existing row before inserting.
- Triggers ON DELETE + ON INSERT if defined.
- If you only want to update values → prefer INSERT ... ON DUPLICATE KEY UPDATE (safer).
- Not all RDBMS support REPLACE (works in MySQL, MariaDB, not in SQL Server / PostgreSQL).

## 🎯 Example Usage
 - Replace a product when stock changes drastically.
 - Bulk update products from another table.
 - Insert or update supplier catalog automatically.
 - Reset item details when conflicts happen.
 - Insert new product if not exists, else replace old details.
