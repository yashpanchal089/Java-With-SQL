/*
syntax for update 
update table_name
set column_1 = value_1, column_2 = value_2,....alter
[where condition];
update table_name

*/

drop table products;

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

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (1, 'Laptop', 'Electronics', 899.99, 25),
    (2, 'Desk Chair', 'Furniture', 149.50, 40),
    (3, 'Coffee Maker', 'Appliances', 79.99, 15),
    (4, 'Headphones', 'Electronics', 129.99, 30),
    (5, 'Desk Lamp', 'Furniture', 24.99, 50);

select * from products;

select  price * 0.9 from products;

update products
set price = price * 0.9 where product_id > 0;

update products
set price = 999.99
where product_id = 1;

update products
set price = 89.99, stock_quantity=30
where product_id = 3;

-- Modify the last_updated column to automatically update on changes
alter table products
modify last_updated timestamp default current_timestamp on update current_timestamp;

update products
set price = 700.00,  stock_quantity=1
where product_id = 1;

update products set price = price * 0.1 where product_id > 0 limit 2;