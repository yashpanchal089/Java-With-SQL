# 🛡️ MySQL GRANT & REVOKE

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00FFB3&lines=MySQL+Access+Control+🛡️;GRANT+|+REVOKE+|+Privileges+|+Roles;Manage+Who+Can+Do+What!)](https://git.io/typing-svg)

## 💡 What Are GRANT and REVOKE?
👉 **GRANT** and **REVOKE** are **MySQL** commands used to control user permissions i.e., who can access what in your database.

Think of your **database as a big office**:
- `GRANT` = You’re giving someone a key to enter certain rooms (permissions).
- `REVOKE` = You’re taking that key back.

## ⚙️ Step 1: Create a User

Before giving permissions, you need a user account.
```sql
CREATE USER 'yash'@'localhost' IDENTIFIED BY 'password123';
```

✅ This creates a user named `yash` who can connect only from your local machine (`localhost`).

If you want the user to connect from anywhere:
```sql
CREATE USER 'yash'@'%' IDENTIFIED BY 'password123';
```
## 🎯 Step 2: GRANT — Give Permissions

**🔹 Syntax**
```sql
GRANT privilege_name ON database_name.table_name TO 'username'@'host';
```

**🔹 Example 1: Grant Access to One Database**
```sql
GRANT ALL PRIVILEGES ON companydb.* TO 'yash'@'localhost';
```
- Meaning:
Yash can now do anything (SELECT, INSERT, UPDATE, DELETE, etc.) in the companydb database.


**🔹 Example 2: Grant Specific Privileges**
```sql
GRANT SELECT, INSERT, UPDATE ON companydb.employee TO 'yash'@'localhost';
```
- Meaning:
Yash can view, add, and update employee records — but not delete them.


**🔹 Example 3: Grant Privileges to All Databases**
```sql
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
```
- Meaning:
This gives the admin user full control over all databases — and the right to grant access to others (like a manager giving out keys).


**🔹 Example 4: Give Access to One Table Only**
```sql
GRANT SELECT ON companydb.department TO 'yash'@'localhost';
```
- Yash can only view department info — no changes allowed.


**🔹 Example 5: Grant EXECUTE for Stored Procedures**
```sql
GRANT EXECUTE ON PROCEDURE companydb.Employee_info TO 'yash'@'localhost';
```
- This lets Yash call the stored procedure but not modify it.

## 🔍 Step 3: Check User Privileges

See what privileges a user currently has:
```sql
SHOW GRANTS FOR 'yash'@'localhost';
```
Output example:
```sql
GRANT SELECT, INSERT, UPDATE ON `companydb`.`employee` TO 'yash'@'localhost';
```
## 🧹 Step 4: REVOKE — Remove Permissions
**🔹 Syntax**
```sql
REVOKE privilege_name ON database_name.table_name FROM 'username'@'host';
```
**🔹 Example 1: Revoke Specific Privilege**
```sql
REVOKE INSERT ON companydb.employee FROM 'yash'@'localhost';
```
- Yash can still SELECT and UPDATE, but no longer INSERT.

**🔹 Example 2: Revoke All Privileges**
```sql
REVOKE ALL PRIVILEGES ON companydb.* FROM 'yash'@'localhost';
```
- Now Yash can’t do anything inside companydb.

**🔹 Example 3: Delete the User Completely**
```sql
DROP USER 'yash'@'localhost';
```

## 🔄 Step 5: Apply Changes

Always reload privileges to make sure MySQL applies updates:
```sql
FLUSH PRIVILEGES;
```
## 📘 Common Privileges List

| Privilege        | What It Allows                          |
| ---------------- | --------------------------------------- |
| **SELECT**       | Read data from tables                   |
| **INSERT**       | Add new data                            |
| **UPDATE**       | Modify existing data                    |
| **DELETE**       | Remove records                          |
| **CREATE**       | Create new tables or databases          |
| **DROP**         | Delete tables or databases              |
| **ALTER**        | Modify table structure                  |
| **EXECUTE**      | Run stored procedures                   |
| **GRANT OPTION** | Allow user to give privileges to others |


## 🧠 Real-Life Analogy

Imagine your **database is a library** 📚
- The Librarian (DBA) gives read access (SELECT) to visitors.
- Only staff can add or remove books (INSERT, DELETE).
- The manager has full control and can give others permission (WITH GRANT OPTION).
- If someone misuses their access — their key is revoked (REVOKE).

## 🧩 Example Scenario — Full Demo
```sql
-- 1️⃣ Create a new user
CREATE USER 'sunny'@'localhost' IDENTIFIED BY 'password123';

-- 2️⃣ Grant specific privileges
GRANT SELECT, INSERT ON companydb.employee TO 'sunny'@'localhost';

-- 3️⃣ Check permissions
SHOW GRANTS FOR 'sunny'@'localhost';

-- 4️⃣ Revoke INSERT permission
REVOKE INSERT ON companydb.employee FROM 'sunny'@'localhost';

-- 5️⃣ Check again
SHOW GRANTS FOR 'sunny'@'localhost';

-- 6️⃣ Remove user
DROP USER 'sunny'@'localhost';
```

## 🚀 Summary
| Command              | Description                 | Example                                                |
| -------------------- | --------------------------- | ------------------------------------------------------ |
| **CREATE USER**      | Create a new database user  | `CREATE USER 'yash'@'localhost' IDENTIFIED BY 'pass';` |
| **GRANT**            | Give privileges             | `GRANT SELECT ON db.table TO 'yash'@'localhost';`      |
| **SHOW GRANTS**      | Display current permissions | `SHOW GRANTS FOR 'yash'@'localhost';`                  |
| **REVOKE**           | Remove privileges           | `REVOKE INSERT ON db.table FROM 'yash'@'localhost';`   |
| **DROP USER**        | Delete user                 | `DROP USER 'yash'@'localhost';`                        |
| **FLUSH PRIVILEGES** | Refresh privilege table     | `FLUSH PRIVILEGES;`                                    |

