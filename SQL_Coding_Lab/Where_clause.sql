/*where clasue
basic syntax:-
SELECT column1, column 2, ... column n  
FROM    table_name  
WHERE [conditions]  
*/

create database bookstore;
use bookstore;

create table books (
book_id int primary key,
title varchar(100),
author varchar(50),
price decimal(10,2),
publication_date date,
category varchar(30),
in_stock int
);

insert into books values(1, 'The MySQL Guide', 'David Make', 26.33, '2025-03-12', 'technology', 50),
(2, 'Data Science Basics', 'Sarah Johnson', 34.99, '2023-03-20', 'Technology', 30),
(3, 'Mystery at Midnight', 'Michael Brown', 19.99, '2023-02-10', 'Mystery', 100),
(4, 'Cooking Essentials', 'Lisa Anderson', 24.99, '2023-04-05', 'Cooking', 75);

insert into books values (5, 'Cooking Book', null , 24.99, '2023-04-05', 'Cooking', 75);
insert into books values (6, 'Mini Cook Book', 'Gohn Smith' , 24.99, '2023-04-05', 'Cooking', 75);
insert into books values (7, 'Giant Cook Book', 'John Smith' , 24.99, '2023-04-05', 'Cooking', 75);

select * from books;

select * from books where category='technology';

select title,price from books where price<30.00;

select title,publication_date from books 
where publication_date >= '2023-03-01';

select * from books where category='technology' and price<30.00;

select * from books where category='technology' or price<30.00;

select * from books where (category='technology' or category='Mystery') and price < 25;

select * from books where NOT category = 'Technology';

/*Finding null values*/

select * from books where author is null;
select * from books where author is not null;

/*Pattern Matching
this is case insensitive */


select * from books where title like '%sql%';
select * from books where title like '%the%';

/*To find word the first in starting remove '%' in start and then search, same for last word */

/*To find case sensitive word*/
select * from books where title like binary '%SQL%';

/*to find wild card use _ohn% */
select * from books where author like '_ohn%';

/*between operator*/
select * from books where price between 20 and 30;

/*using in keyword*/
select * from books where category in
('Technology', 'Mystery', 'Science');

/*You can combine the operators*/

select * from books
where price between 20 and 30 and publication_date >= '2023-03-01';

/*using sub query*/
select * from books where price > (select avg(price) from books);

/*Practice question*/
select * from books where year(publication_date) = 2023 and price < (select avg(price) from books);
select * from books where category = 'technology' and title like '%Data%' and in_stock > 50;
select * from books where (category = 'technology' and price  > 30  or category = 'Mystery' and price < 20);
select * from books where (author like '%son%' or  author like '%th%') and publication_date > '2023-03-31';

