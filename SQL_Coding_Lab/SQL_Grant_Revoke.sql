create database PermissionDB;
use PermissionDB;

create table student(Student_ID INT, Student_Name varchar(50), Fav_Fruits varchar(50));
desc student;

insert into student values (1, 'john','Mango'); 

insert into student values
(2, 'Alex','Banana'), 
(3, 'ALien','Pineapple'), 
(4, 'Rome','Graps'),
(5, 'Cane','Papaya'),
(6, 'Kook','Watermelon');

select * from student;
call student_info;

update student
set Student_Name = 'John'
where Student_ID = 1;

create user ramu identified by 'ramu';

grant select ON PermissionDB.student to ramu;

grant select on permissiondb.* to ramu;
grant update on permissiondb.* to ramu;

create table employees(emp_id int auto_increment, emp_name varchar(50), emp_sal bigint);

