# SQL Foreign Keys 🔗
[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Foreign+Keys+%F0%9F%94%97;Referential+Integrity;One-to-Many;Many-to-Many;Composite+Keys)](https://git.io/typing-svg)


Foreign keys enforce **relationships** and **referential integrity** between tables.

---

## 📌 What is a Foreign Key?

- A **foreign key** is a column or set of columns in one (child) table that **references** a primary key in another (parent) table.  
- This creates a **link / relationship** between the two tables.  
- **Parent table**: the table holding the primary key.  
- **Child table**: the table that holds the foreign key referencing the parent.  
- **Purpose**:  
  - Referential integrity (you cannot reference a non-existent parent).  
  - Data validation.  
  - Structuring relational data.

---

## 🔄 Types of Relationships via Foreign Keys

1. **One-to-One (1:1)**  
   - Each record in A corresponds to exactly one in B.  
   - Example: `employee_details` references `employees.employee_id`.

2. **One-to-Many (1:N)**  
   - One parent record is referenced by many child records.  
   - Example: Multiple employees referencing the same department.

3. **Many-to-Many (N:M)**  
   - Requires a **junction table** (bridge table) with two foreign keys referencing two parent tables.  
   - Example: `Enrollments` linking `Students` and `Courses`.

---

## 🛠️ SQL Script & Examples

```sql
-- Foreign Keys Script & Concepts

-- Create database
CREATE DATABASE ForeignkeyDB;
USE ForeignkeyDB;

-- Parent table: departments
CREATE TABLE departments (
    department_id INT NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    PRIMARY KEY (department_id)
);

-- Child table: employees with foreign key to departments
CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert departments
INSERT INTO departments (department_id, department_name, location)
VALUES 
    (1, 'Human Resources', 'Floor 1'),
    (2, 'Marketing', 'Floor 2'),
    (3, 'Engineering', 'Floor 3'),
    (4, 'Finance', 'Floor 1');

-- Insert employees linking to valid departments
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES
    (101, 'John', 'Smith', 'john.smith@company.com', '2018-06-20', 55000.00, 1),
    (102, 'Sarah', 'Johnson', 'sarah.johnson@company.com', '2019-03-15', 62000.00, 2),
    (103, 'Michael', 'Williams', 'michael.williams@company.com', '2020-01-10', 75000.00, 3),
    (104, 'Emily', 'Brown', 'emily.brown@company.com', '2019-11-05', 68000.00, 3),
    (105, 'David', 'Jones', 'david.jones@company.com', '2021-02-28', 58000.00, 4),
    (106, 'Jessica', 'Davis', 'jessica.davis@company.com', '2020-07-16', 61000.00, 2),
    (107, 'Robert', 'Miller', 'robert.miller@company.com', '2018-09-12', 72000.00, 3);

SELECT * FROM employees;

-- Attempt to insert an employee with a non-existent department (this fails)
INSERT INTO employees (..., department_id)
VALUES (..., 45);
-- Error: foreign key constraint fails

-- Insert an employee with NULL department_id (if allowed)
INSERT INTO employees (..., department_id)
VALUES (..., NULL);

-- Create projects table, then add foreign key later
CREATE TABLE projects (
    project_id INT NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    manager_id INT,
    PRIMARY KEY (project_id)
);

ALTER TABLE projects
  ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

SHOW CREATE TABLE projects;

ALTER TABLE projects DROP FOREIGN KEY projects_ibfk_1;

SHOW CREATE TABLE projects;

-- Junction table for many-to-many (example)
CREATE TABLE employee_skills (
    skill_id INT NOT NULL,
    emp_id INT AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    proficiency_level ENUM('Beginner','Intermediate','Advanced','Expert') NOT NULL,
    PRIMARY KEY (skill_id),
    CONSTRAINT fk_emp_skill FOREIGN KEY (emp_id) REFERENCES employees(employee_id)
);
