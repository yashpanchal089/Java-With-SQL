SQL Basics: DDL, DML, DCL & TCL

SQL commands are grouped into four main categories based on what they do.

1. DDL – Data Definition Language
Purpose:
Used to define, modify, or delete the structure of database objects like tables, indexes, or databases.

Common Commands:
- CREATE   : Create a new table, database, or index
- ALTER    : Modify an existing table (add, delete, or change columns)
- DROP     : Delete a table or database completely
- TRUNCATE : Remove all data from a table but keep its structure

Example:
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

ALTER TABLE students ADD email VARCHAR(100);

DROP TABLE students;

TRUNCATE TABLE students;


2. DML – Data Manipulation Language
Purpose:
Used to manage data inside tables. You can add, update, delete, or read data.

Common Commands:
- INSERT : Add new records into a table
- UPDATE : Modify existing records
- DELETE : Remove records
- SELECT : Retrieve records from table

Example:
INSERT INTO students (id, name, age) VALUES (1, 'Yash', 23);

UPDATE students SET age = 24 WHERE id = 1;

DELETE FROM students WHERE id = 1;

SELECT * FROM students;


3. DCL – Data Control Language
Purpose:
Used to control access and permissions on database objects.

Common Commands:
- GRANT  : Give permission to users
- REVOKE : Remove permission from users

Example:
GRANT SELECT, INSERT ON students TO 'user1'@'localhost';

REVOKE INSERT ON students FROM 'user1'@'localhost';


4. TCL – Transaction Control Language
Purpose:
Used to manage transactions (group of SQL statements). A transaction is a set of operations that must succeed together or fail together.

Common Commands:
- COMMIT    : Save changes permanently
- ROLLBACK  : Undo uncommitted changes
- SAVEPOINT : Set a checkpoint in a transaction

Example:
START TRANSACTION;

UPDATE students SET age = 25 WHERE id = 1;

SAVEPOINT sp1;
S
ROLLBACK TO sp1;

COMMIT;


Summary Table:
Category   | Purpose                         | Main Commands
-----------------------------------------------------------
DDL        | Define or modify database       | CREATE, ALTER, DROP, TRUNCATE
DML        | Manipulate data inside tables  | INSERT, UPDATE, DELETE, SELECT
DCL        | Control access / permissions   | GRANT, REVOKE
TCL        | Manage transactions            | COMMIT, ROLLBACK, SAVEPOINT

Tips:
- DDL → Think “structure”
- DML → Think “data”
- DCL → Think “permissions”
- TCL → Think “transactions”