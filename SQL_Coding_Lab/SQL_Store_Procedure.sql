
create database CompanyDB_1;
use CompanyDB_1;
	CREATE TABLE employee (
		id INT AUTO_INCREMENT PRIMARY KEY,
		first_name VARCHAR(50) NOT NULL,
		last_name VARCHAR(50) NOT NULL,
		department VARCHAR(50),
		salary DECIMAL(10,2),
		age INT,
		join_date timestamp default current_timestamp 
	);

INSERT INTO employee (first_name, last_name, department, salary, age)
VALUES
('John', 'Smith', 'HR', 55000.00, 30),
('Sarah', 'Johnson', 'Finance', 72000.00, 28),
('Michael', 'Brown', 'IT', 88000.00, 35),
('Emily', 'Davis', 'Marketing', 60000.00, 26),
('Robert', 'Wilson', 'Operations', 75000.00, 40),
('Jennifer', 'Martinez', 'Sales', 67000.00, 29),
('David', 'Anderson', 'IT', 91000.00, 32),
('Lisa', 'Thomas', 'Finance', 70000.00, 27),
('James', 'Jackson', 'HR', 52000.00, 31),
('Mary', 'White', 'Marketing', 63000.00, 25);

-- calling this statment from store procudure
call Employee_Info;

-- with one parameter input
call Empoyee_department('Finance');

call employee_dep_name(@records);

select @records;

call Employee_Salary(@records, 'sales');

select @records;
