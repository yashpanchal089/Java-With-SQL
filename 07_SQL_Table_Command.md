# 📘 SQL Table Commands – Notes with Examples

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Create+Table;Insert+Table;Alter+Table;Drop+Table)](https://git.io/typing-svg)


---

## 📌 Introduction  
This file explains the use of **SQL Table Commands** with examples.  
It covers:  
- **CREATE** → How to create tables with constraints.  
- **INSERT** → How to insert data into tables.  
- **ALTER** → How to modify existing tables (add, drop, or change columns and constraints).  
- **DROP** → How to remove tables safely.  

The example includes two related tables:  
- **Employees** → Stores employee details.  
- **Departments** → Stores department information.  
Both are linked using **department_id** (foreign key).  

---

## 1. **CREATE Command**

### 📝 Notes
- **Primary Key** → Uniquely identifies each row. Only one per table, but can be a **composite key** (multiple columns).  
- **Constraints**:  
  - `NOT NULL` → Value cannot be NULL.  
  - `UNIQUE` → Value must be unique (can allow NULL once).  
  - `DEFAULT` → Assigns a default value if none provided.  
  - `CHECK` → Validates condition on column values.  
- **Properties**:  
  - `AUTO_INCREMENT` → Automatically increases integer values.  
- **Expressions**:  
  - `current_date()` → Returns current date.  
  - `current_timestamp` → Returns current date & time.
    
- Syntax for CREATE Table command:
```
create table [Schema] <table_name">  
(  
<column_name1> <data type> [Default <expression>] [<Column constraints>],  
(<column_name2> <data type> [Default <expression>] [<Column constraints>],  
(<column_namen> <data type> [Default <expression>] [<Column constraints>],  
[<table_constaints>]  
);  

```    

---

### 💻 SQL Code
```sql
-- Show existing databases
SHOW DATABASES;

-- Use test database
USE test;

-- Show existing tables
SHOW TABLES;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE()),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary > 0.0),
    employement_status ENUM('active', 'on leave', 'terminated') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```
## 2. **INSERT Command**

### 📝 Notes

- The SQL INSERT INTO statement is the most commonly used Data Manipulation Language (DML) command whose work is to insert data in a database.
- It is one of the most important and basic commands in SQL for writing data into a database table.
- It is used to insert a single or multiple records in a table.

- Syntax for insert command:
```
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

---

### 💻 SQL Code
```
-- Insert into employees table

INSERT INTO employees (
    first_name, last_name, hire_date, email, phone_number, salary
) VALUES (
    'Orry', 'seri', '2024-09-22', 'orriseri@gmail.com', '+91-526-631-7494', 96000.00
);

-- Insert into departments table

INSERT INTO departments (department_name, location)
VALUES 
    ('IT', 'Building A'),
    ('HR', 'Building B'),
    ('Sales', 'Building C');
```

---

## 3. **ALTER Command**

### 📝 Notes
 - The ALTER TABLE statement in Structured Query Language allows you to add, modify, and delete columns of an existing table. 
 - This statement also allows database users to add and remove various SQL constraints on the existing tables.
 - Any user can also change the name of the table using this statement.

- Syntax for insert command:
```
ALTER TABLE table_name ADD column_name column-definition;  
```

---

### 💻 SQL Code
Add column:
```
ALTER TABLE table_name ADD COLUMN column_name datatype;
```

Add multiple columns:
```
Add TABLE table_name ADD COLUMN column_name1, column_name1 ;
```


ALTER TABLE table_name
```
ADD COLUMN col1 datatype,
ADD COLUMN col2 datatype;
```

Rename column:
```
ALTER TABLE table_name RENAME COLUMN old_name TO new_name;
```

Drop column:
```
ALTER TABLE table_name DROP COLUMN column_name;
```

Add constraints:
```
ALTER TABLE table_name ADD CHECK (condition);
```

Modify column:
```
ALTER TABLE table_name MODIFY COLUMN column_name datatype NOT NULL;
```
- Foreign keys → can be nullable, but once declared with NOT NULL they must always have a valid reference.

```
-- Add emergency_contact column with validation
ALTER TABLE employees
ADD COLUMN emergency_contact VARCHAR(100) NOT NULL 
CHECK (emergency_contact REGEXP '[A-Za-z]+: [0-9+-]+$');

-- Modify emergency_contact to be NOT NULL
ALTER TABLE employees
MODIFY COLUMN emergency_contact VARCHAR(100) NOT NULL;

-- Add department_id column
ALTER TABLE employees
ADD COLUMN department_id INT;

-- Make department_id NOT NULL
ALTER TABLE employees
MODIFY COLUMN department_id INT NOT NULL;

-- Add foreign key relationship
ALTER TABLE employees
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
```

---

## 4. **DROP Command**

### 📝 Notes
 - The DROP command is used to remove database objects like tables, databases, views, indexes, or stored procedures permanently.
 - When we remove something by using the DROP command, we can not roll back the action.
 - If we want to recover the deleted data, it comes only after backing up the data.
 - The DROP command is used in DDL statements.
 - The DROP TABLE command in SQL is utilized to permanently delete a table definition and all data from the existing table in the database.
 - This command also deletes all the stored data in the table.



- Syntax for DROP command:
```
DROP TABLE table_name;   
```

---

### 💻 SQL Code

Drop table:
```
DROP TABLE table_name;
```

Drop multiple tables:
```
DROP TABLE table1, table2;
```

 - Cannot drop a table if another table depends on it (foreign key constraint).
 - Example: If employees.department_id references departments.department_id, you cannot drop departments first.

Use IF EXISTS to avoid errors:
```
DROP TABLE IF EXISTS table_name;
```

```
-- Drop employees table
DROP TABLE employees;

-- Drop departments table (only if no dependency)
DROP TABLE departments;

-- Drop with safeguard
DROP TABLE IF EXISTS ok;
```

----

### 💻 SQL Commands Cheat Sheet (Quick Summary)

| Command                      | Purpose                                         |
| ---------------------------- | ----------------------------------------------- |
| `CREATE TABLE`               | Create a new table with columns and constraints |
| `SHOW TABLES`                | List all tables in the current database         |
| `INSERT INTO`                | Insert new data into a table                    |
| `ALTER TABLE ADD COLUMN`     | Add a new column to a table                     |
| `ALTER TABLE DROP COLUMN`    | Remove a column from a table                    |
| `ALTER TABLE MODIFY COLUMN`  | Change datatype or constraints of a column      |
| `ALTER TABLE ADD CONSTRAINT` | Add check, not null, or foreign key             |
| `RENAME COLUMN`              | Change the name of an existing column           |
| `DROP TABLE`                 | Delete a table permanently                      |
| `DROP TABLE IF EXISTS`       | Safely drop a table if it exists                |


