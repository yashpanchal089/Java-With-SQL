show databases;
create database StringFunctionDB;
use StringFunctionDB;

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50)
);

INSERT INTO employees (first_name, last_name, email, department) VALUES
('John', 'Doe', 'john.doe@example.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
('Emily', 'Davis', 'emily.davis@example.com', 'HR'),
('Chris', 'Brown', 'chris.brown@example.com', 'Finance');

select * from employees;

-- concat functoins
select concat(first_name, " " , last_name) as 'Full Name' from employees ;


select first_name, length(first_name) from employees;
select first_name, upper(first_name), lower(first_name) from employees;
select trim(upper("                 ok                 ")) as sample;
select first_name, substring(first_name, 1, 3) as first_name_char from employees;
select first_name, locate('a', first_name) as position_of_a from employees;
select first_name, locate('ch', first_name) as position_of_ch from employees;

select first_name,replace(email,"example.com", "yashtech.com") from employees;
select first_name, reverse(first_name) as reversed_name from employees;

select first_name, left(first_name, 2) as 'Left most 2', right(first_name, 2) as 'Right most 2' from employees;

select first_name, ascii(first_name), ascii(lower(first_name)) from employees;

select length("Hello");
select length("नमस्कार");

select char_length("नमस्कार") as 'length of char';

select soundex("smith");
select soundex("smyth");

select first_name, soundex(first_name) from employees;

select * from employees where soundex("jane") =  soundex(first_name);

-- NUMERIC FUNCTION

CREATE DATABASE NumericFunctionsDB;
USE NumericFunctionsDB;

CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_value DECIMAL(10,5)
);

INSERT INTO numbers (num_value) VALUES
(25.6789),
(-17.5432),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);

-- Basic display of all values
SELECT * FROM numbers;

-- Absolute value function
select num_value, ABS(num_value) as absolute_value from numbers;

-- Rounding functions
select num_value, round(num_value, 1) as round_value from numbers;
select num_value, ceil(num_value) from numbers;
select num_value, floor(num_value) from numbers;
select num_value, truncate(num_value, 2) from numbers;

-- Mathematical operations
select num_value, power(num_value, 2) from numbers;
select num_value, mod(num_value, 2) from numbers;
select num_value, sqrt(abs(num_value)) from numbers;

SELECT POWER(5, 2);
SELECT MOD(10, 3);

SELECT SQRT(25);
SELECT SQRT(25);
SELECT EXP(2), LOG(2, 8), LOG10(1000);

-- Exponential functions with handling for out-of-range values
select num_value,
case
when num_value> 709 then 'value id too large'
else exp(num_value)
end as expvalue
from numbers;

-- Logarithmic functions
select num_value, log(2, abs(num_value) + 1) as log_base2 from numbers;
select num_value, log10(abs(num_value) + 1) as log_base10 from numbers;

-- Trigonometric functions
select num_value,
sin(num_value), cos(num_value), tan(num_value) from numbers;

-- Pi constant and angle conversions
select pi() as pi_value;

select num_value, radians(num_value), degrees(num_value) from numbers;

-- Bitwise operations
select bit_and(num_value) from numbers;
SELECT BIT_OR(num_value) FROM numbers;
SELECT BIT_XOR(num_value) FROM numbers;

-- DATE FUNCTIONS

-- Current date and time functions
select current_user();
select now();
select current_date();
select current_time();
select current_timestamp();

-- Date part extraction
select year(now());
select month(now());
select date(now());
select day(now());
select hour(now());
select minute(now());
select second(now());

-- Date formatting
select date_format('2025-01-10', '%W, %M, %e, %Y ');
select date_format('2025-10-09', '%e %M, %Y');

-- Date arithmetic
select date_add('2025-03-01', interval 7 month);
select date_sub('2025-03-01', interval 7 year);
select date_add('2025-03-01', interval 7 year);
select date_sub(now(), interval 5 year);


-- Date difference
select datediff('2025-02-01', '2024-10-01');

-- Unix timestamp functions (seconds since January 1, 1970, at 00:00:00 UTC)
select unix_timestamp('2025-03-03');
select from_unixtime(1740940200);

-- Date function examples with a database
CREATE DATABASE DateExamplesDB;
USE DateExamplesDB;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME
);

INSERT INTO orders (customer_name, order_date) VALUES
('Alice', '2025-09-3 20:15:00'),
('Bob', '2025-09-29 14:45:30'),
('Charlie', '2025-09-28 09:30:15'),
('Akshay', '2024-03-01 10:15:00');

drop table orders;

INSERT INTO orders (customer_name, order_date) VALUES
('john', '2025-09-29 10:15:00');

-- Querying orders in the last 7 days
select * from orders where order_date >= date_sub(now(), interval 7 day);

-- AGGREGATE FUNCTIONS
CREATE DATABASE CompanyDB2;
USE CompanyDB2;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'HR', 50000, '2018-06-23'),
('Bob', 'IT', 70000, '2019-08-01'),
('Charlie', 'Finance', 80000, '2017-04-15'),
('David', 'HR', 55000, '2020-11-30'),
('Eve', 'IT', 75000, '2021-01-25'),
('Frank', 'Finance', 72000, '2019-07-10'),
('Grace', 'IT', 68000, '2018-09-22'),
('Hank', 'Finance', 90000, '2016-12-05'),
('Ivy', 'HR', 53000, '2022-03-19'),
('Jack', 'IT', 72000, '2017-05-12');

select * from employees;

-- Count employees in HR department
select count(*) from employees where department='HR';

-- Sum of salaries in HR department
select sum(salary) from employees where department='HR';

-- Average salary in HR department
select avg(salary) from employees where department = 'HR';

-- Minimum salary in HR department
select min(salary) from employees where department = 'HR';

-- Maximum salary in HR department
select max(salary) from employees where department = 'HR';

-- Comprehensive statistics for all employees
select
count(*), sum(salary), avg(salary), min(salary), max(salary)
from employees;

-- Group by department to get statistics per department
select 
department, count(*) from employees group by department;