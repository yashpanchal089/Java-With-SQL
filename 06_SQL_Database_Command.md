# SQL Database Commands – Explained

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=FF5733&lines=create+database;show+databases;use+database_name;select+database();drop+database+database_name;)](https://git.io/typing-svg)


## 1. Creating a Database
```sql
create database school_db;
create database college_db;
create database degree_db;
```
- The `CREATE DATABASE` statement is used to **make a new database**.  
- Here, three databases are created:  
  - `school_db` → can store data related to school (students, teachers, exams, etc.)  
  - `college_db` → can store data for a college system  
  - `degree_db` → can store data for different degrees and courses  

---

## 2. Showing All Databases
```sql
show databases;
```
- Displays a **list of all databases** available in the SQL server.  
- Helps you confirm whether your newly created databases exist.  

---

## 3. Using a Specific Database
```sql
use degree_db;
```
- The `USE` statement tells SQL to **switch the working database**.  
- After running this command, all tables, queries, and operations will apply to `degree_db`.  

---

## 4. Check Current Database
```sql
SELECT DATABASE();
```
- This query shows which database you are **currently connected to**.  
- Useful if you’re working with multiple databases and want to confirm the active one.  

---

## 5. Deleting a Database
```sql
drop database degree_db;
```
- The `DROP DATABASE` command is used to **delete a database permanently**.  
- ⚠️ Warning: All the tables and data inside the database will also be deleted.  
- Example: `degree_db` is removed completely from the server.  

---

## ✅ In Summary
- `CREATE DATABASE` → Make a new database  
- `SHOW DATABASES` → List all databases  
- `USE` → Select a database to work with  
- `SELECT DATABASE()` → Check current database  
- `DROP DATABASE` → Delete a database permanently  
