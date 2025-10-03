# 📝 SQL UPDATE Statement with Examples

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=FF5733&lines=SQL+UPDATE+%F0%9F%93%9D;Single+Column+Update;Multiple+Column+Update;WHERE+Clause+Matters;LIMIT+Clause;Auto+Update+Timestamp)](https://git.io/typing-svg)
---

## 🔹 Syntax
```sql
-- General syntax
UPDATE table_name
SET column_1 = value_1, column_2 = value_2, ...
[WHERE condition];
```
**⚠️ Always use WHERE carefully!**

Without WHERE, the update will affect all rows.

---
## 🏗️ Example: Store Inventory
**1. Create database and table**
```sql
CREATE DATABASE store_inventory;
USE store_inventory;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(20),
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 2. Insert sample data
```sql
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (1, 'Laptop', 'Electronics', 899.99, 25),
    (2, 'Desk Chair', 'Furniture', 149.50, 40),
    (3, 'Coffee Maker', 'Appliances', 79.99, 15),
    (4, 'Headphones', 'Electronics', 129.99, 30),
    (5, 'Desk Lamp', 'Furniture', 24.99, 50);

SELECT * FROM products;
```

## 🔄 Update Examples
## 3. Apply a discount (10% off all products)
```sql
UPDATE products
SET price = price * 0.9 
WHERE product_id > 0;
```

**👉 Here, every product price is reduced by 10%.**

## 4. Update a single product
```sql
UPDATE products
SET price = 999.99
WHERE product_id = 1;
```

**👉 Changes Laptop price to 999.99.**

## 5. Update multiple columns at once
```sql
UPDATE products
SET price = 89.99, stock_quantity = 30
WHERE product_id = 3;
```

**👉 Updates Coffee Maker price and stock together**.

## 6. Auto-update timestamp when row changes
```sql
ALTER TABLE products
MODIFY last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
ON UPDATE CURRENT_TIMESTAMP;
```

**👉 Now, whenever a row updates, last_updated refreshes automatically.**

## 7. Update with multiple changes
```sql
UPDATE products
SET price = 700.00, stock_quantity = 1
WHERE product_id = 1;
```

## 8. Limit number of updates
```sql
UPDATE products 
SET price = price * 0.1 
WHERE product_id > 0 
LIMIT 2;
```

**👉 Only updates 2 rows, even if more satisfy the condition.**

---

## ✅ Key Notes:
- Use WHERE to avoid mass updates ❗
- You can update one column or many.
- ALTER can ensure timestamps update automatically.
- LIMIT helps in testing without touching all rows.
