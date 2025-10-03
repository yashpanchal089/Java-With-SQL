/*Select command

SELECT column1, coumn2,...
form table_name;

*/

show databases;
create database company;
use company;

create table employees (
id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
salary decimal(10,2),
hire_date DATE
);

insert into employees (
first_name,
last_name,
department,
salary,
hire_date)
 values ('John', 'Dak', 'IT', 60000.00, '2022-05-19'),
 ('alex', 'who', 'sales', 90000.00, '2024-03-22'),
 ('array', 'Dak', 'HR', 9000.00, '2021-01-23'),
 ('kat', 'mane', 'IT', 60660.00, '2025-09-30'),
 ('san', 'kit', 'HR', 6005000.00, '2014-04-09');
 
select * from employees;
 
select first_name as 'First Name', last_name as 'Last Name', department as 'Department' from employees;
 
select * from employees where department='IT';
 
select * from employees where department='IT' order by salary ASC;

select * from employees order by salary desc limit 2;
 
select distinct department from employees;

select first_name,last_name,salary*1.1 as 'Salary after rasie' from employees;

select concat(first_name,last_name)  as 'Full Name',year(hire_date), round(salary,1) from employees where salary > 70000;

select avg(salary) from employees;

select * from employees where salary > (select avg(salary) from employees);

select first_name,last_name from employees where department='IT' union
select first_name,last_name from employees where department='HR';

select count(*),department from employees group by department;

select 2+2;
select now();