show databases;
create database db12;
use db12;

create table products (
product_id INT primary key,
product_name varchar(100),
category varchar(50),
price decimal(10,2),
stock_quantity int,
last_updated timestamp
);

INSERT INTO products VALUES
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200,'2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

select * from products;

-- Sort by price in ascending order (ASC is optional as it's the default)
select * from products order by price asc;

-- working with multiple columns

select * from products order by category, price;
select * from products order by category desc, price desc;

-- sorting by column position

select * from products order by 4;

-- sorting with where clause

select * from products where category = 'Electronics' order by price;

-- sorting with case sensitive
select * from products order by binary category;

-- Function-Based Sorting
select product_name, length(product_name) from products;

select * from products order by length(product_name);

select * from products order by year(last_updated);

select * from products order by day(last_updated);

-- ORDER BY and LIMIT

select * from products order by stock_quantity desc limit 1;

-- Custom Sorting Orders

select * from products order by category;

select * from products order by field(category, 'Electronics', 'Appliances', 'Furniture'), price desc;

/*low stock and price high
low stock = less than 50 items
good price = greater than $200.
best deals = low stock and good price
*/

select *, stock_quantity <= 50 and price >= 200 from products order by (stock_quantity <= 50 and price >= 200)desc ;

select *, case 
when stock_quantity <= 50 and price >= 200 then 1
when stock_quantity <= 50 then 2
else 3
end as priority from products order by 
case 
when stock_quantity <= 50 and price >= 200 then 1
when stock_quantity <= 50 then 2
else 3
end;

-- Null values handling

INSERT INTO products VALUES
(6, 'Desk Lamp', 'Furniture', NULL, 45, '2024-01-18 13:25:00'),
(7, 'Keyboard', 'Electronics', 89.99, NULL, '2024-01-19 15:10:00');

select * from products order by price;

select *,price is null  from products order by price is null;

-- Sorting with Calculated Columns

select *, price*stock_quantity as 'Total Value' from products order by price*stock_quantity;
-- Query Performance Analysis

-- Examine query execution plan for multi-column sort
EXPLAIN SELECT * FROM products
ORDER BY category, price;

-- Compare with primary key sort performance
EXPLAIN SELECT * FROM products 
ORDER BY product_id;

