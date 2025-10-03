show databases;
create database StoreDB;
use storedb;

drop table products;

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
price DECIMAL(10,2),
stock INT
);
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1208.00, 18),
('Phone', 'Electronics', 800.00, 15),
('Tablet', 'Electronics', 500.00, 20),
('Headphones', 'Accessories', 150.00, 50),
('Mouse', 'Accessories', 30.00, 100),
('Keyboard', 'Accessories', 45.80, 80),
('ipad', 'Electronics', 600.00, 20);

select * from products;

/*Get all products with price of exactly 600*/
select * from products where price = 600.00;

/*Get all products that are NOT priced at 800
use NOT
use !=
use <> (diamond)
*/

select * from products where price != 800.00;
select * from products where NOT price = 800;
select * from products where price <> 800.00;

/*get all products below 500*/
select * from products where price < 500;

/*get all products above 700*/
select * from products where price > 500;

/*get all products priced at or below 150*/
select * from products where price <= 150;


/*get all products priced at or above 800*/
select * from products where price >= 800;

/*Get all products where the category is exactly "Electronics"*/
select * from products where category >= 'Electronics';

create table orders ( 
 order_id int auto_increment primary key,
 order_date date,
 customer_name varchar(50)
);

INSERT INTO orders (order_date, customer_name) VALUES
('2024-02-01', 'Alice'),
('2024-02-05', 'Bob'),
('2024-02-10', 'Charlie'),
('2024-02-15', 'David');

select * from orders;

/*Retrieve Orders Placed Before February 18, 2024 I*/
select * from orders where order_date < '2024-02-10';

select * from products where product_name > 'Mouse';

select '100' > '2';
