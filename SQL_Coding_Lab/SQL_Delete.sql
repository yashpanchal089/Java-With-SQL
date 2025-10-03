-- SQL DELETE Tutorial
-- Demonstrates how to remove records from a database table
-- DELETE FROM table_name WHERE condition;
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

-- Delete a specific record by ID
delete from products where product_id = 10;


-- Delete records based on a condition
delete from products where price < 50.00;
-- Note: In safe update mode, this might generate an error if primary key is not used in WHERE clause

-- Delete expensive products
delete from products;

delete from products where price > 300;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO orders VALUES (1, 2, 3);
SELECT * FROM orders;

-- Try to delete a referenced product (will fail due to foreign key constraint)
DELETE FROM products WHERE product_id = 2;
-- 14:14:26	DELETE FROM products WHERE product_id = 2	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`delete_tutorial`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`))	0.016 sec

alter table orders drop foreign key orders_ibfk_1;

alter table orders
add constraint orders_ibfk_1
foreign key (product_id) REFERENCES products(product_id)
on delete cascade;

DELETE FROM products WHERE product_id = 2;

SELECT * FROM products;
SELECT * FROM orders;


INSERT INTO orders VALUES (1, 3, 2);

alter table orders drop foreign key orders_ibfk_1;

alter table orders
add constraint orders_ibfk_1
foreign key (product_id) REFERENCES products(product_id)
on delete set null;

delete from products where product_id = 3;

-- Auto-increment behavior with DELETE
CREATE TABLE auto_example (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO auto_example (name) VALUES ('Item 1'), ('Item 2'), ('Item 3');
DELETE FROM auto_example;
INSERT INTO auto_example (name) VALUES ('New Item');

SELECT * FROM auto_example;

-- TRUNCATE TABLE demonstration
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

select * from employees;

-- Remove all employees using TRUNCATE (faster than DELETE)
TRUNCATE TABLE employees;
-- Alternative syntax: TRUNCATE employees;

-- Check the result (empty table)
SELECT * FROM employees;

-- For comparison, DELETE can also remove all rows
DELETE FROM employees;

-- Key differences between TRUNCATE and DELETE:
-- Speed: TRUNCATE is generally faster because it drops and recreates the table rather than removing rows one by one.
-- Logging: DELETE logs individual row removals, while TRUNCATE only logs table deallocation.
-- WHERE clause: DELETE supports WHERE conditions to remove specific rows, while TRUNCATE always removes all rows.
-- Auto-increment: TRUNCATE resets auto-increment counters to their initial value, while DELETE preserves the current counter value.
-- Triggers: DELETE activates DELETE triggers, while TRUNCATE does not fire any triggers.
-- Rollback: DELETE operations can be rolled back in a transaction, while TRUNCATE generally cannot
-- SQL Categories: TRUNCATE is a DDL (Data Definition Language) command, DELETE is a DML (Data Manipulation Language) command