# 📘 SQL Comparison Operators  

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Equal+To+(=);Not+Equal+To(!=+or+<>);Greater+Than+(>);Greater+Than+or+Equal+To+(>=);Less+Than+(<);Less+Than+or+Equal+To+(<=))](https://git.io/typing-svg)

Comparison operators in SQL are used to compare two values.  
They are mostly used with the **WHERE clause** to filter records from a table.  

---

## 🔑 List of SQL Comparison Operators

1. **Equal To (=)** → Checks if two values are equal.  
2. **Not Equal To (!= or <>)** → Checks if two values are not equal.  
3. **Greater Than (>)** → Returns records greater than a given value.  
4. **Greater Than or Equal To (>=)** → Returns records greater than or equal to a given value.  
5. **Less Than (<)** → Returns records less than a given value.  
6. **Less Than or Equal To (<=)** → Returns records less than or equal to a given value.  

---

## 🔍 Comparison Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `=`      | Equal to | `SELECT * FROM products WHERE price = 600;` |
| `!=` / `<>` | Not equal to | `SELECT * FROM products WHERE price != 800;` |
| `>`      | Greater than | `SELECT * FROM products WHERE price > 500;` |
| `<`      | Less than | `SELECT * FROM products WHERE price < 500;` |
| `>=`     | Greater than or equal to | `SELECT * FROM products WHERE price >= 800;` |
| `<=`     | Less than or equal to | `SELECT * FROM products WHERE price <= 150;` |

👉 Both `!=` and `<>` are used for "Not Equal" in SQL.  
👉 When comparing strings (e.g., product names), the comparison is **lexical (alphabetical order)**.

## 🗄️ Database & Table Setup  

```sql
-- Create Database
SHOW DATABASES;
CREATE DATABASE StoreDB;
USE StoreDB;

-- Drop table if already exists
DROP TABLE IF EXISTS products;

-- Create products table
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(50),
  category VARCHAR(50),
  price DECIMAL(10,2),
  stock INT
);

-- Insert sample records
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1208.00, 18),
('Phone', 'Electronics', 800.00, 15),
('Tablet', 'Electronics', 500.00, 20),
('Headphones', 'Accessories', 150.00, 50),
('Mouse', 'Accessories', 30.00, 100),
('Keyboard', 'Accessories', 45.80, 80),
('iPad', 'Electronics', 600.00, 20);

-- View all products
SELECT * FROM products;
```
---
## ⚡ Examples of Comparison Operators

1. Equal To (=)
- Get all products priced exactly 600
```
SELECT * FROM products WHERE price = 600.00;
```

2. Not Equal To (!= or <>)
- Get products NOT priced at 800
```
SELECT * FROM products WHERE price != 800.00;
SELECT * FROM products WHERE NOT price = 800.00;
SELECT * FROM products WHERE price <> 800.00;
```

3. Less Than (<)
- Get products priced below 500
```
SELECT * FROM products WHERE price < 500;
```

4. Greater Than (>)
- Get products priced above 700
```
SELECT * FROM products WHERE price > 700;
```

5. Less Than or Equal To (<=)
- Get products priced at or below 150
```
SELECT * FROM products WHERE price <= 150;
```

6. Greater Than or Equal To (>=)
- Get products priced at or above 800
```
SELECT * FROM products WHERE price >= 800;
```

## 📅 Comparison with Dates
```
-- Create Orders table
CREATE TABLE orders ( 
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  order_date DATE,
  customer_name VARCHAR(50)
);

-- Insert records
INSERT INTO orders (order_date, customer_name) VALUES
('2024-02-01', 'Alice'),
('2024-02-05', 'Bob'),
('2024-02-10', 'Charlie'),
('2024-02-15', 'David');

-- View orders
SELECT * FROM orders;
```

- Retrieve orders placed before February 10, 2024
```
SELECT * FROM orders WHERE order_date < '2024-02-10';
```

## 📅 📝 String Comparison

- Compare strings (alphabetical order)
```
SELECT * FROM products WHERE product_name > 'Mouse';
```

- Compare string numbers
```
SELECT '100' > '2';   -- Returns FALSE because strings compare alphabetically
```

