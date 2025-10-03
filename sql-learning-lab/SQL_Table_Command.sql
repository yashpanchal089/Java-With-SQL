show databases;
use test;
drop table employees;
show tables;

create table employees(
employee_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
hire_date date default (current_date()),
email varchar(100) unique,
phone_number varchar(100) unique,
salary decimal(10,2) check (salary > 0.0),
employement_status enum('active', 'on leave', 'terminated') default 'active',
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);


/*Insert into table_name (column1, column2, column3) values(column1, column2, column3);*/
insert into employees(
first_name,
last_name,
hire_date, 
email, 
phone_number,
salary
) values (
'Orry',
'seri',
'2024-09-22',
'orriseri@gmail.com',
'+91-526-631-7494',
96000.00
);

insert into employees(
first_name,
last_name, 
email, 
phone_number,
salary,
emergency_contact,
department_id
) values (
'michal',
'chan',
'michalchan@gmail.com',
'+91-222-666-11111',
97900.00,
"ok: 23232", 
1
);

select * from employees;
select * from departments;

create table departments(
department_id int primary key auto_increment,
department_name varchar(100) not null,
location varchar(100),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

insert into departments ( department_name, location)
 values 
('IT', 'Building  A'), ('HR', 'Building  B'), ('Sales', 'Building  C');




alter table employees
add column emergency_contact varchar(100) not null check (emergency_contact regexp '[A-Za-z]+: [0-9+-]+$');

alter table employees
add column emergency_contact varchar(100);

alter table employees
add column emergency_contact varchar(100);

alter table employees
add check (emergency_contact regexp '[A-Za-z]+: [0-9+-]+$');

alter table employees
modify column emergency_contact varchar(100) not null;

alter table employees
add column department_id int;

alter table employees
drop column department_id;

alter table employees
modify column department_id int not null;

alter table employees
add foreign key (department_id) references departments(department_id);


