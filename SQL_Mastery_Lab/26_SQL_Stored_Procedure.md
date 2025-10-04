# 🧠 Stored Procedures in MySQL
[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00C2FF&lines=Stored+Procedures+in+MySQL+🧠;IN+|+OUT+|+INOUT+Parameters;Reusable+SQL+Code;Fast+and+Secure;Function-like+Power)](https://git.io/typing-svg)


## 📘 What is a Stored Procedure?
- A Stored Procedure is a predefined block of SQL statements saved in the database.
- Instead of writing the same SQL queries again and again, you can store them once and just call them whenever needed.

**💡 Think of it like saving a function in programming that you can reuse anytime!**

## 🏗️ Real-Life Analogy
- Imagine you run a restaurant 🍽️.
- Every time someone orders food, the chef doesn’t reinvent the recipe — he follows a stored recipe.
- Similarly, in SQL, instead of writing the same query again, you store it as a procedure and execute it when needed.

## ⚙️ Syntax
```sql
CREATE PROCEDURE procedure_name()
BEGIN
    SQL statements;
END;
```
## 🧩 Types of Parameters

| Type      | Description                                  | Usage                                      |
| --------- | -------------------------------------------- | ------------------------------------------ |
| **IN**    | Input parameter (passed *into* procedure)    | Used to filter or calculate based on input |
| **OUT**   | Output parameter (returned *from* procedure) | Used to get calculated results             |
| **INOUT** | Acts as both input and output                | You can modify and return same variable    |

## 🧾 Examples
**1️⃣ Simple Procedure — Show All Employees**
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `Employee_info`()
BEGIN
    SELECT * FROM employee;
END;
```

**📞 Call it:**
```sql
CALL Employee_info();
```

**2️⃣ Procedure with IN Parameter — Filter by Department**
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `Employee_department`(IN dept VARCHAR(50))
BEGIN
    SELECT * FROM employee WHERE department = dept;
END;
```

**📞 Call it:**
```sql
CALL Employee_department('HR');
```
**3️⃣ Procedure with INOUT Parameter — Average Salary by Department**
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `Employee_Salary`(INOUT avg_salary DECIMAL(10,2), IN dept VARCHAR(50))
BEGIN
    SELECT AVG(salary) INTO avg_salary FROM employee WHERE department = dept;
END;
```

**📞 Call it:**
```sql
SET @salary = 0;
CALL Employee_Salary(@salary, 'IT');
SELECT @salary AS 'Average Salary';
```
**4️⃣ Procedure with OUT Parameter — Count of Employees**
```sql
CREATE DEFINER=`root`@`localhost` PROCEDURE `Employee_dep_name`(OUT emp_count INT)
BEGIN
    SELECT COUNT(*) INTO emp_count FROM employee;
END;
```

**📞 Call it:**
```sql
CALL Employee_dep_name(@total);
SELECT @total AS 'Total Employees';
```
---
**🧰 Advantages of Stored Procedures**
- Reusable — no need to rewrite queries
- Secure — restrict direct access to tables
- Faster — precompiled by MySQL engine
- Easy Maintenance — change once, use everywhe
