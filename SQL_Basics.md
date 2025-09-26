# 🗄️ SQL Basics: DDL, DML, DCL & TCL  

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Learn+SQL;Master+DDL+DML+DCL+TCL;Database+Commands+Simplified)](https://git.io/typing-svg)

💡 **Understanding SQL commands made simple**  
SQL (Structured Query Language) is the backbone of every relational database. Whether you’re managing data, controlling access, or handling transactions, SQL has you covered!  

---

## 🏗️ 1️⃣ DDL – Data Definition Language
**Purpose:** Define, modify, or delete the **structure** of database objects.  

**Common Commands:**
- `CREATE` : Create a new table, database, or index  
- `ALTER` : Modify an existing table (add, delete, or change columns)  
- `DROP` : Delete a table or database completely  
- `TRUNCATE` : Remove all data from a table but keep its structure  

**Example:**
```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

ALTER TABLE students ADD email VARCHAR(100);
DROP TABLE students;
TRUNCATE TABLE students;

💡 Tip: Think “structure” when using DDL commands.

---

## 📝 2️⃣ DML – Data Manipulation Language
Purpose: Manipulate data inside tables.

**Common Commands:**
INSERT : Add new records
UPDATE : Modify existing records
DELETE : Remove records
SELECT : Retrieve records

**Example: **
INSERT INTO students (id, name, age) VALUES (1, 'Yash', 23);
UPDATE students SET age = 24 WHERE id = 1;
DELETE FROM students WHERE id = 1;
SELECT * FROM students;

💡 Tip: Think “data” when using DML commands.

## 🔒 3️⃣ DCL – Data Control Language
Purpose: Control access and permissions on database objects.

**Common Commands:**
GRANT : Give permission to users
REVOKE : Remove permission from users

**Example:**
GRANT SELECT, INSERT ON students TO 'user1'@'localhost';
REVOKE INSERT ON students FROM 'user1'@'localhost';

💡 Tip: Think “permissions” when using DCL commands.

## 🔄 4️⃣ TCL – Transaction Control Language
Purpose: Manage transactions – a group of SQL statements that must succeed or fail together.

**Common Commands:**
COMMIT : Save changes permanently
ROLLBACK : Undo uncommitted changes
SAVEPOINT : Set a checkpoint in a transaction

**Example:**
START TRANSACTION;
UPDATE students SET age = 25 WHERE id = 1;
SAVEPOINT sp1;
ROLLBACK TO sp1;
COMMIT;

💡 Tip: Think “transactions” when using TCL commands.

| Category | Purpose                      | Main Commands                  |
| -------- | ---------------------------- | ------------------------------ |
| DDL      | Define or modify structure   | CREATE, ALTER, DROP, TRUNCATE  |
| DML      | Manipulate table data        | INSERT, UPDATE, DELETE, SELECT |
| DCL      | Control access & permissions | GRANT, REVOKE                  |
| TCL      | Manage transactions          | COMMIT, ROLLBACK, SAVEPOINT    |

⚡ Fun Tips
DDL → Structure
DML → Data
DCL → Permissions
TCL → Transactions

🌟 Let’s Practice!
Try creating a small database, adding tables, inserting some data, and experimenting with transactions.
SQL is all about hands-on learning!

