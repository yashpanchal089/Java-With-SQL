# 📘 SQL Subqueries – Notes & Examples

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00CFFF&lines=SQL+Subqueries+%F0%9F%92%BB;Basic+Subqueries;Joins+vs+Subqueries;Correlated+Subqueries;EXISTS+%26+NOT+EXISTS;Real+Examples)](https://git.io/typing-svg)

- This document demonstrates SQL Subqueries using an Online Store database with `customers`, `products`, `orders`, and `order_items` tables.
- Subqueries help you nest one query inside another to perform complex filtering, aggregations, and conditions.

---
## 📂 1. Database Setup
```sql
-- Create database
CREATE DATABASE online_store;
USE online_store;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50),
    state VARCHAR(2),
    signup_date DATE
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```
## 📥 2. Sample Data

- We add customers, products, and orders for realistic examples.
```sql
-- Insert data into customers
INSERT INTO customers (first_name, last_name, email, city, state, signup_date) VALUES
('John', 'Smith', 'john.smith@example.com', 'New York', 'NY', '2023-01-15'),
('Sarah', 'Johnson', 'sarah.j@example.com', 'Los Angeles', 'CA', '2023-02-20'),
('Michael', 'Brown', 'michael.b@example.com', 'Chicago', 'IL', '2023-03-05'),
('Emily', 'Davis', 'emily.d@example.com', 'Houston', 'TX', '2023-01-30'),
('Robert', 'Wilson', 'robert.w@example.com', 'Phoenix', 'AZ', '2023-02-10'),
('Jennifer', 'Martinez', 'jennifer.m@example.com', 'Philadelphia', 'PA', '2023-03-15'),
('David', 'Anderson', 'david.a@example.com', 'San Antonio', 'TX', '2023-01-25'),
('Lisa', 'Thomas', 'lisa.t@example.com', 'San Diego', 'CA', '2023-02-28'),
('James', 'Jackson', 'james.j@example.com', 'Dallas', 'TX', '2023-03-12'),
('Mary', 'White', 'mary.w@example.com', 'San Jose', 'CA', '2023-01-18');

-- Insert data into products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop Pro', 'Electronics', 1299.99, 25),
('Smartphone X', 'Electronics', 899.99, 50),
('Wireless Headphones', 'Electronics', 199.99, 100),
('Coffee Maker', 'Home Appliances', 79.99, 30),
('Blender', 'Home Appliances', 49.99, 40),
('Running Shoes', 'Sports', 129.99, 75),
('Yoga Mat', 'Sports', 29.99, 120),
('Mystery Novel', 'Books', 14.99, 200),
('Cookbook', 'Books', 24.99, 150),
('Desk Chair', 'Furniture', 149.99, 15);

-- Insert data into orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-04-10 14:30:00', 1499.98),
(2, '2023-04-11 10:15:00', 249.98),
(3, '2023-04-12 16:45:00', 899.99),
(4, '2023-04-13 13:20:00', 1329.98),
(2, '2023-04-14 09:30:00', 49.99),
(5, '2023-04-15 15:10:00', 179.98),
(6, '2023-04-16 11:05:00', 159.98),
(7, '2023-04-17 14:55:00', 39.98),
(8, '2023-04-18 12:40:00', 899.99),
(9, '2023-04-19 16:25:00', 229.98),
(10, '2023-04-20 10:50:00', 279.97),
(1, '2023-04-21 13:35:00', 24.99),
(3, '2023-04-22 15:15:00', 129.99);

-- Insert data into order_items
INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 1299.99),
(1, 3, 1, 199.99),
(2, 5, 1, 49.99),
(2, 7, 1, 29.99),
(2, 9, 1, 24.99),
(3, 2, 1, 899.99),
(4, 1, 1, 1299.99),
(4, 6, 1, 129.99),
(5, 5, 1, 49.99),
(6, 4, 1, 79.99),
(6, 8, 1, 14.99),
(6, 9, 1, 24.99),
(7, 6, 1, 129.99),
(7, 8, 2, 14.99),
(8, 8, 1, 14.99),
(8, 9, 1, 24.99),
(9, 2, 1, 899.99),
(10, 3, 1, 199.99),
(10, 6, 1, 129.99),
(11, 5, 1, 49.99),
(11, 7, 1, 29.99),
(11, 8, 1, 14.99),
(12, 9, 1, 24.99),
(13, 6, 1, 129.99);
```

## 🔎 3. Basic Subqueries
#### ✅ Customers who have placed at least one order
```sql
SELECT * FROM customers 
WHERE customer_id IN (
    SELECT DISTINCT customer_id FROM orders
);
```
#### ❌ Customers who haven’t placed any orders
```sql
SELECT * FROM customers 
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id FROM orders
);
```
#### 📊 Products with price higher than average
```sql
SELECT * FROM products 
WHERE price > (
    SELECT AVG(price) FROM products
);
```

## 📑 4. GROUP BY + HAVING with Subquery
```sql
-- Find categories with more than 2 products
SELECT category, COUNT(*) 
FROM products 
GROUP BY category 
HAVING COUNT(*) > 2;
```
## 🏷 5. Subqueries in WHERE Clause
**Orders from Texas customers**
```sql
SELECT * FROM orders 
WHERE customer_id IN (
    SELECT customer_id FROM customers WHERE state = 'TX'
);
```

**Equivalent using JOIN:**
```sql
SELECT * FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
WHERE c.state = 'TX';
```

## 🔗 6. Joins vs Subqueries
- Find all customers who ordered Electronics products

**Using JOINs**
```sql
SELECT * FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE p.category = "Electronics";
```

**Using Subquery**
```sql
SELECT * FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.product_id IN (
    SELECT product_id FROM products WHERE category = "Electronics"
);
```

## 💰 7. Subqueries with Aggregation
- Customers who spent more than the average spending
```sql
SELECT *, 
    (SELECT SUM(total_amount) 
     FROM orders 
     WHERE customer_id = customers.customer_id) AS total_spent 
FROM customers 
WHERE
    (SELECT SUM(total_amount) FROM orders WHERE customer_id = customers.customer_id) > 
    (SELECT AVG(total_spent) 
     FROM (SELECT customer_id, SUM(total_amount) AS total_spent 
           FROM orders GROUP BY customer_id) AS customer_total);
```

## 🧩 8. Complex Subqueries
- Customers who ordered all products in Electronics
```sql
SELECT c.email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = "Electronics"
GROUP BY c.customer_id
HAVING COUNT(DISTINCT p.product_id) = 
       (SELECT COUNT(*) FROM products WHERE category="Electronics");
```
**Customers outside CA who bought the same product-quantity as CA customers**
```sql
SELECT c.email, c.state, p.product_name, oi.quantity 
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.state != 'CA' 
AND (oi.product_id, oi.quantity) IN (
    SELECT oi.product_id, oi.quantity 
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE c.state = 'CA'
);
```
## 🔄 9. Correlated Subqueries & EXISTS
**Customers who placed at least one order**
```sql
SELECT * FROM customers c 
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE c.customer_id = o.customer_id
);
```
**Customers who haven’t placed any order**
```sql
SELECT * FROM customers c 
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE c.customer_id = o.customer_id
);
```
**Products never ordered**
```sql
SELECT * FROM products p 
WHERE NOT EXISTS (
    SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id
);
```
**Customers who ordered Electronics products**
**Using EXISTS**
```sql
SELECT * FROM customers c 
WHERE EXISTS (
    SELECT 1 FROM orders o 
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE c.customer_id = o.customer_id
    AND p.category = 'Electronics'
);
```

## 🎯 Summary
- Subqueries = queries inside queries.
- Can be used in WHERE, HAVING, SELECT clauses.
- Useful for aggregation comparisons, filtering, EXISTS checks.
- Often interchangeable with JOINs (choose based on readability & performance).
