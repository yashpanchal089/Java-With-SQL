# SQL Primary Keys
[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=SQL+Primary+Keys+%F0%9F%94%91;Uniquely+Identify+Records+%F0%9F%93%9A;Auto-Increment+%F0%9F%94%96;Composite+Keys)](https://git.io/typing-svg)


Primary key is a **single or combination of columns** used to **uniquely identify each record** in a table.  
- A column with a primary key **cannot be NULL or empty**.  
- A table can have multiple columns, but **only one primary key**.  
- Primary key **always contains unique values**.  

---

## 🔑 Key Benefits of Primary Keys

- Uniquely identify each record in a table  
- Prevent duplicate records  
- Serve as a reference point for relationships between tables (foreign keys)  
- Optimize performance for record retrieval  

---

## How Primary Keys Work Internally

1. **Uniqueness Enforcement**  
   - The database automatically ensures that no two rows have the same primary key value.  

2. **Index Creation**  
   - Most databases create an **index** (usually B-Tree) on the primary key for fast lookups.  
   - In InnoDB (MySQL), a **clustered index** is used, meaning table rows are stored in order of the primary key.  

3. **Fast Retrieval**  
   - Queries using the primary key can **directly access rows** without scanning the whole table.  

4. **Referential Integrity**  
   - Foreign keys reference primary keys for **relationship validation**.  

---

## SQL Examples

### 1. Creating a Database

```sql
CREATE DATABASE PrimaryKeys;
USE PrimaryKeys;
```
- `student_id` is the primary key.
 - Attempting to insert a duplicate `student_id` will fail.
   
### 2. Basic Primary Key Implementation
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO students (student_id, first_name, last_name, email)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com'),
(2, 'Maria', 'Garcia', 'maria.garcia@example.com'),
(3, 'Ahmed', 'Khan', 'ahmed.khan@example.com');

SELECT * FROM students;
```
- `AUTO_INCREMENT` automatically generates unique primary key values.
- No need to manually specify the `product_id.`

**⚠️ Attempting to insert a duplicate primary key will fail:**
```sql
INSERT INTO students (student_id, first_name, last_name, email)
VALUES (1, 'Jane', 'Doe', 'jane.doe@example.com');
-- Error Code: 1062. Duplicate entry '1' for key 'PRIMARY'
```

### 3. Auto-increment Primary Keys
```sql
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);

INSERT INTO products (product_name, price, description)
VALUES 
('Laptop', 1299.99, 'High-performance laptop'),
('Smartphone', 799.99, 'Latest model smartphone'),
('Headphones', 199.99, 'Noise-cancelling headphones');

SELECT * FROM products;
```
- With `AUTO_INCREMENT`, the primary key is automatically generated.

### 4. Adding Primary Keys to Existing Tables
```sql
CREATE TABLE suppliers (
    supplier_id INT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100)
);

ALTER TABLE suppliers
ADD PRIMARY KEY (supplier_id);
```
 - You can add a primary key after table creation using `ALTER TABLE.`

### 5. Composite Primary Keys
```sql
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES 
(1, 101, '2023-01-15', 'A'),
(1, 102, '2023-01-15', 'B+'),
(2, 101, '2023-01-16', 'A-'),
(3, 103, '2023-01-17', 'B');

-- This will fail because it's a duplicate composite key
INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES (1, 101, '2023-02-01', 'C');
-- Error: Duplicate entry '1-101' for key 'PRIMARY'

```
 - Composite primary keys consist of multiple columns.
 - The combination of `student_id` + `course_id` must be unique.
---
## 🔹 Best Practices for Primary Keys
- Always include a primary key in every table
- Use auto-increment unless you have a specific reason not to
- Keep primary keys simple, preferably `INT` or `BIGINT`
- Avoid using meaningful data like emails or names as primary keys (use surrogate keys instead)
---
## ✅ Summary
- Primary keys uniquely identify rows
- Internally, they create an index for fast data retrieval
- Can be single-column or composite
- Auto-increment keys reduce manual effort
Referential integrity is maintained through primary key relationships
