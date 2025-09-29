# 📘 SQL ORDER BY Clause  

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00A2FF&lines=ORDER+BY+Clause;Ascending+(ASC);Descending+(DESC);Multiple+Columns;Custom+Sorting;NULL+Handling;Function-Based+Sorting;Performance+Tips)](https://git.io/typing-svg)

 - The `ORDER BY` clause in SQL is used to **sort the result set** of a query.  
 - By default, results are sorted in **ascending order (ASC)**, but you can also use **descending order (DESC)**.
 - Whenever we want to sort the records based on the columns stored in the tables of the SQL database, then we consider using the ORDER BY clause in SQL.


---

## 🔑 Key Points about ORDER BY  

1. **Syntax**  
```sql
   SELECT column1, column2, ...
   FROM table_name
   ORDER BY column1 ASC | DESC;
```

2. Sorting with Multiple Columns
 -You can sort by more than one column.
 - Example: ORDER BY category, price DESC;

3. Custom Sorting Order
- Use `FIELD()` or CASE to define your own custom sort sequence.

4. Null Value Handling
- By default, NULL values come first in ascending order and last in descending order.
- You can control this using expressions like price `IS NULL`.

5. Advanced Sorting Techniques
- Sorting by column position (e.g., `ORDER BY 4`)
- Function-based sorting `(ORDER BY LENGTH(product_name))`
- Sorting by calculated columns (e.g., `price * stock_quantity)`

6. Performance Considerations
- Sorting on indexed columns is faster.
- Using multiple columns in ORDER BY may require more resources.
- Use `EXPLAIN` to analyze query performance.

7. Best Practices
- Always specify `ASC` or `DESC` for clarity.
- Avoid unnecessary sorting for large datasets.
- Use indexes to improve sorting performance.

---

## **🗄️ Database & Table Setup**
```
-- Create Database
SHOW DATABASES;
CREATE DATABASE db12;
USE db12;

-- Create Products Table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10,2),
  stock_quantity INT,
  last_updated TIMESTAMP
);

-- Insert Sample Records
INSERT INTO products VALUES
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

-- View All Records
SELECT * FROM products;
```
---
## **⚡ ORDER BY Examples**
**1. Basic Sorting**
- Sort by price in ascending order
```
SELECT * FROM products ORDER BY price ASC;
```
- Sort by price in descending order
```
SELECT * FROM products ORDER BY price DESC;
```

**2. Sorting with Multiple Columns**
- Sort by category first, then price
```
SELECT * FROM products ORDER BY category, price;
```
- Sort both columns in descending order
```
SELECT * FROM products ORDER BY category DESC, price DESC;
```

**3. Sorting by Column Position**
- Sort by the 4th column (price)
```
SELECT * FROM products ORDER BY 4;
```

**4. Sorting with WHERE Clause**
- Sort only Electronics category by price
```
SELECT * FROM products WHERE category = 'Electronics' ORDER BY price;
```

**5. Case-Sensitive Sorting**
- Sort category in case-sensitive manner
```
SELECT * FROM products ORDER BY BINARY category;
```

**6. Function-Based Sorting**
- Sort by length of product name
```
SELECT product_name, LENGTH(product_name) FROM products;
SELECT * FROM products ORDER BY LENGTH(product_name);
```
- Sort by year and day from timestamp
```
SELECT * FROM products ORDER BY YEAR(last_updated);
SELECT * FROM products ORDER BY DAY(last_updated);
```
**7. ORDER BY with LIMIT**
- Get the product with highest stock
```
SELECT * FROM products ORDER BY stock_quantity DESC LIMIT 1;
```

**8. Custom Sorting Order**
- Default alphabetical category sort
```
SELECT * FROM products ORDER BY category;
```
- Custom order: Electronics → Appliances → Furniture
```
SELECT * FROM products 
ORDER BY FIELD(category, 'Electronics', 'Appliances', 'Furniture'), price DESC;
```

**9. Sorting with Conditions (CASE)**
- Prioritize "Best Deals" first (low stock + high price)
```
SELECT *, 
  CASE 
    WHEN stock_quantity <= 50 AND price >= 200 THEN 1
    WHEN stock_quantity <= 50 THEN 2
    ELSE 3
  END AS priority
FROM products 
ORDER BY priority;
```

**10. Handling NULL Values**
- Insert sample NULL values
```
INSERT INTO products VALUES
(6, 'Desk Lamp', 'Furniture', NULL, 45, '2024-01-18 13:25:00'),
(7, 'Keyboard', 'Electronics', 89.99, NULL, '2024-01-19 15:10:00');
```
- Sort by price (NULLs appear last in DESC)
```
SELECT * FROM products ORDER BY price;
```
- Show NULL values at the end
```
SELECT *, price IS NULL FROM products ORDER BY price IS NULL;
```

**11. Sorting with Calculated Columns**

- Sort by total value (price × stock)
```
SELECT *, price*stock_quantity AS 'Total Value' 
FROM products ORDER BY price*stock_quantity;
```

**12. Performance Analysis**  
- Analyze sorting on multiple columns
```
EXPLAIN SELECT * FROM products ORDER BY category, price;
```
- Compare with sorting by primary key
```
EXPLAIN SELECT * FROM products ORDER BY product_id;
```
