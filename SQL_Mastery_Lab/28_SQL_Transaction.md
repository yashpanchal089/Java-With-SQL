# 💳 MySQL TCL (Transaction Control Language)

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00FFAA&lines=MySQL+TCL+💳;COMMIT+|+ROLLBACK+|+SAVEPOINT;Keep+Your+Data+Safe+and+Consistent!)](https://git.io/typing-svg)

## 💡 What is TCL in MySQL?

**TCL** stands for **Transaction Control Language**.
It helps you **control the execution of SQL statements** so that your data remains **accurate, consistent, and safe** even if something goes wrong.

👉 Think of TCL like a “**safety net**” for your database operations.

## ⚙️ Why Transactions Matter?

Imagine you are transferring ₹1000 from Sunny’s account to Yash’s account.

- You withdraw ₹1000 from Sunny.
- You deposit ₹1000 into Yash’s account.

If one succeeds and the other fails (like a power outage 💡), your data becomes inconsistent.

That’s where **transactions** help  they make sure both actions happen **together or not at all**.

## 🧩 TCL Commands in MySQL
| Command                       | Description                                      |
| ----------------------------- | ------------------------------------------------ |
| **START TRANSACTION / BEGIN** | Starts a new transaction                         |
| **COMMIT**                    | Saves all the changes permanently                |
| **ROLLBACK**                  | Undo the changes (restore previous state)        |
| **SAVEPOINT**                 | Marks a specific point to which you can rollback |
| **RELEASE SAVEPOINT**         | Deletes a savepoint                              |
| **SET AUTOCOMMIT**            | Enables or disables automatic commit             |

## 🏗️ Step-by-Step Example

Let’s go through a practical example using a banking system 💰
```sql
CREATE DATABASE tcl_demo;
USE tcl_demo;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    holder_name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts VALUES 
(1, 'Sunny', 5000.00),
(2, 'Yash', 3000.00);

SELECT * FROM accounts;
```

## 1️⃣ START TRANSACTION (or BEGIN)

Starts a transaction block.
```sql
START TRANSACTION;
```
## 💸 2️⃣ Perform Multiple Operations

Let’s simulate transferring ₹1000 from Sunny → Yash.
```sql
UPDATE accounts SET balance = balance - 1000 WHERE holder_name = 'Sunny';
UPDATE accounts SET balance = balance + 1000 WHERE holder_name = 'Yash';
```
## 🧾 3️⃣ COMMIT

If both queries are successful, save the changes permanently.
```sql
COMMIT;
```
✅ Now both updates are final — data is consistent.

## 🔙 4️⃣ ROLLBACK — Undo Changes

Let’s say you accidentally updated the wrong account:
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 2000 WHERE holder_name = 'Yash';
UPDATE accounts SET balance = balance + 2000 WHERE holder_name = 'Sunny';

ROLLBACK;
```

❌ The `ROLLBACK` command cancels everything done after START TRANSACTION.

✅ Your data goes back to the previous stable state.

## 🎯 5️⃣ SAVEPOINT — Mark a Point in the Transaction

You can set checkpoints inside a transaction to rollback partially.
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE holder_name = 'Sunny';
SAVEPOINT step1;

UPDATE accounts SET balance = balance + 500 WHERE holder_name = 'Yash';
SAVEPOINT step2;

-- Oops! You want to undo last step only
ROLLBACK TO step1;

COMMIT;
```

✅ Only the second update is undone.
- The first one (Sunny -500) remains.

## 🧹 6️⃣ RELEASE SAVEPOINT

Once a savepoint is no longer needed:
```sql
RELEASE SAVEPOINT step1;
```

This frees up memory and cleans up your transaction.

## ⚙️ 7️⃣ SET AUTOCOMMIT

By default, MySQL commits every change automatically.

To control it manually, you can disable autocommit.
```sql
SET AUTOCOMMIT = 0;  -- Disable auto commit
START TRANSACTION;

UPDATE accounts SET balance = balance - 1000 WHERE holder_name = 'Sunny';
UPDATE accounts SET balance = balance + 1000 WHERE holder_name = 'Yash';

COMMIT;  -- You must commit manually
```

✅ When autocommit is OFF, MySQL waits for your COMMIT or ROLLBACK.

## 🧠 Real-Life Analogy

Imagine you’re shopping online 🛍️

- Adding items to cart = making SQL updates (not committed yet)
- Clicking “Place Order” = COMMIT
- Clicking “Cancel Order” = ROLLBACK
- Saving mid-cart progress = SAVEPOINT

TCL gives you control before finalizing your actions!

## 🔍 Full Demonstration
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 1;
SAVEPOINT sp1;

UPDATE accounts SET balance = balance + 500 WHERE account_id = 2;

-- Oops, wrong user! Rollback last step only
ROLLBACK TO sp1;

-- Continue more operations if needed
UPDATE accounts SET balance = balance + 200 WHERE account_id = 2;

COMMIT;
```
## 🚀 Key Takeaways
| Command                | Purpose                      | Example               |
| ---------------------- | ---------------------------- | --------------------- |
| **START TRANSACTION**  | Begin a new transaction      | `START TRANSACTION;`  |
| **COMMIT**             | Save all changes permanently | `COMMIT;`             |
| **ROLLBACK**           | Undo all changes             | `ROLLBACK;`           |
| **SAVEPOINT**          | Create a rollback point      | `SAVEPOINT sp1;`      |
| **ROLLBACK TO**        | Undo up to a savepoint       | `ROLLBACK TO sp1;`    |
| **SET AUTOCOMMIT = 0** | Manual transaction control   | `SET AUTOCOMMIT = 0;` |
