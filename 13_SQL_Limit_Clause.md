# 📘 SQL – LIMIT & OFFSET Clause  

---

## 📌 Introduction
- The **LIMIT clause** in SQL is used to **control the number of records** returned by a query.  
- The **OFFSET keyword** is used with LIMIT for **pagination** (skipping a defined number of rows before fetching results).  
- Together, they help in retrieving subsets of data efficiently.  

✅ Common use cases:  
- Pagination (showing limited records per page).  
- Retrieving top N records.  
- Sampling random records.  

---
## 🔑 Syntax  

```sql
-- Basic usage
SELECT column1, column2 
FROM table_name 
LIMIT row_count;

-- With OFFSET
SELECT column1, column2 
FROM table_name 
LIMIT row_count OFFSET offset_count;

-- Alternative MySQL syntax
SELECT column1, column2 
FROM table_name 
LIMIT offset, row_count;
```

## 📌 Key Points 

 - `LIMIT N` → Returns the first N rows.
 - `LIMIT offset`, `count` → Skips `offset` rows, then returns the next `count` rows.
 - `ORDER BY` should always be used with `LIMIT` for predictable results.
 - `OFFSET` is mainly used for pagination.

## 🧑‍💻 SQL Script & Examples
```
-- Create Database & Table
SHOW DATABASES;
CREATE DATABASE db13;
USE db13;

DROP TABLE products;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Sample Data
INSERT INTO products (name, price, category) VALUES
('Laptop', 999.99, 'Electronics'),
('Smartphone', 499.99, 'Electronics'),
('Coffee Maker', 79.99, 'Appliances'),
('Headphones', 149.99, 'Electronics'),
('Blender', 59.99, 'Appliances'),
('Tablet', 299.99, 'Electronics'),
('Microwave', 199.99, 'Appliances'),
('Smart Watch', 249.99, 'Electronics'),
('Toaster', 39.99, 'Appliances'),
('Speaker', 89.99, 'Electronics');

-- View All Products
SELECT * FROM products;

-- 1️⃣ LIMIT Example: First 2 Records
SELECT * FROM products ORDER BY id LIMIT 2;

-- 2️⃣ LIMIT with OFFSET Example
SELECT * FROM products ORDER BY id LIMIT 2 OFFSET 2;

-- 3️⃣ Pagination (3 items per page)
SELECT * FROM products ORDER BY id LIMIT 0, 3;  -- Page 1
SELECT * FROM products ORDER BY id LIMIT 3, 3;  -- Page 2
SELECT * FROM products ORDER BY id LIMIT 6, 3;  -- Page 3

-- 4️⃣ Top 3 Most Expensive Products
SELECT * FROM products ORDER BY price DESC LIMIT 3;

-- 5️⃣ Get 5 Random Products
SELECT * FROM products ORDER BY RAND() LIMIT 5;
```

## ⚡ Performance Considerations
- Queries with large OFFSET values can be slow, as the database must scan and skip many rows.
```
-- Potentially slow with large offset
SELECT * 
FROM products 
ORDER BY created_at 
LIMIT 1000000, 10;

-- Better alternative using WHERE (filter by indexable column)
SELECT * 
FROM products 
WHERE created_at > '2025-01-01 00:00:00' 
ORDER BY created_at 
LIMIT 10;
```

## ✅ Best Practices

 - Always use ORDER BY with LIMIT for consistent results.
 - For pagination, prefer indexed filters over large OFFSET values.
 - Use LIMIT with DESC ordering for retrieving top records.
- For large data sets, consider keyset pagination instead of OFFSET.

## 🚀 Summary

- LIMIT → Restricts the number of rows returned.
- OFFSET → Skips rows before fetching results.
- Pagination → Implemented using LIMIT + OFFSET.
- Be cautious with performance when using very large OFFSET values.
