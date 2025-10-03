show databases;
create database db13;
use db13;

drop table products;
create table products (
id int primary key auto_increment,
name varchar(100),
price decimal(10,2),
category varchar(50),
created_at timestamp default current_timestamp
);

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

select * from products;

select * from products order by id limit 2;
 
 -- select * from products limit [row_count] offset [offset_count];
select * from products order by id limit 2 offset 2;

-- select * from products limit [offset], [row_count];

-- page size3 items per page

select * from products order by id limit 0, 3;
select * from products order by id limit 3, 3;
select * from products order by id limit 3, 6;
 
 -- top 3 most expensive products
 
 select * from products order by price desc limit 3;
 
 -- get random products
 
 select * from products order by rand() limit 5 ;
