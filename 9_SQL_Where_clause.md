# 📘 SQL – WHERE Clause

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Where+Clause;Comparison+Operators;Logical+Operators;Pattern+Matching;NULL+Check;Between;IN;Subquery)](https://git.io/typing-svg)

---

## 📌 Introduction
The `WHERE` clause in SQL is used to **filter records** based on specified conditions.  
It is commonly used with `SELECT`, `UPDATE`, and `DELETE` statements to return or affect only those rows that meet the criteria.

---

## 1. **WHERE Clause – Notes & Operators**

- **Purpose:**  
  - Filters records to meet specific conditions  
  - Optional in SQL DML statements, but useful for precise selection  

The `WHERE` clause in SQL uses conditional operators to filter data:

| Operator | Meaning                     |
|----------|-----------------------------|
| `=`      | Equal                       |
| `>`      | Greater than                |
| `<`      | Less than                   |
| `>=`     | Greater than or equal to    |
| `<=`     | Less than or equal to       |
| `<>`     | Not equal to                |


- **Logical Operators:**  
  - `AND` → Combines multiple conditions, all must be true  
  - `OR` → Either condition must be true  
  - `NOT` → Negates a condition  

- **Pattern Matching:**  
  - `LIKE` → Case-insensitive pattern search  
  - `%` → Matches any sequence of characters  
  - `_` → Matches exactly one character  
  - `BINARY` → Makes `LIKE` case-sensitive  

- **Other Useful Operators:**  
  - `IS NULL` / `IS NOT NULL` → Finds null or non-null values  
  - `BETWEEN` → Values within a range  
  - `IN` → Matches any value in a given list  

- **Subquery Usage:**  
  - Filter based on a result from another query  

---

## 2. **SQL Code Example**

```sql
-- Create database and table
CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(10,2),
    publication_date DATE,
    category VARCHAR(30),
    in_stock INT
);

-- Insert records
INSERT INTO books VALUES
(1, 'The MySQL Guide', 'David Make', 26.33, '2025-03-12', 'technology', 50),
(2, 'Data Science Basics', 'Sarah Johnson', 34.99, '2023-03-20', 'Technology', 30),
(3, 'Mystery at Midnight', 'Michael Brown', 19.99, '2023-02-10', 'Mystery', 100),
(4, 'Cooking Essentials', 'Lisa Anderson', 24.99, '2023-04-05', 'Cooking', 75),
(5, 'Cooking Book', NULL, 24.99, '2023-04-05', 'Cooking', 75),
(6, 'Mini Cook Book', 'Gohn Smith', 24.99, '2023-04-05', 'Cooking', 75),
(7, 'Giant Cook Book', 'John Smith', 24.99, '2023-04-05', 'Cooking', 75);

-- Select all books
SELECT * FROM books;

-- Filter examples
SELECT * FROM books WHERE category='technology';
SELECT title, price FROM books WHERE price<30.00;
SELECT title, publication_date FROM books WHERE publication_date >= '2023-03-01';
SELECT * FROM books WHERE category='technology' AND price<30.00;
SELECT * FROM books WHERE category='technology' OR price<30.00;
SELECT * FROM books WHERE (category='technology' OR category='Mystery') AND price < 25;
SELECT * FROM books WHERE NOT category = 'Technology';

-- Handling NULL values
SELECT * FROM books WHERE author IS NULL;
SELECT * FROM books WHERE author IS NOT NULL;

-- Pattern matching
SELECT * FROM books WHERE title LIKE '%sql%';
SELECT * FROM books WHERE title LIKE '%the%';
SELECT * FROM books WHERE title LIKE BINARY '%SQL%';
SELECT * FROM books WHERE author LIKE '_ohn%';

-- Range and list operators
SELECT * FROM books WHERE price BETWEEN 20 AND 30;
SELECT * FROM books WHERE category IN ('Technology', 'Mystery', 'Science');

-- Combining operators
SELECT * FROM books
WHERE price BETWEEN 20 AND 30 AND publication_date >= '2023-03-01';

-- Subquery example
SELECT * FROM books WHERE price > (SELECT AVG(price) FROM books);
```

## 3. **Cheat Sheet – Quick Summary**

| Feature              | Example                                        |
| -------------------- | ---------------------------------------------- |
| Equal                | `WHERE category='Technology'`                  |
| Not equal            | `WHERE category<> 'Mystery'`                   |
| Greater / Less than  | `WHERE price > 20`                             |
| AND / OR / NOT       | `WHERE price>20 AND category='IT'`             |
| NULL check           | `WHERE author IS NULL`                         |
| Pattern match        | `WHERE title LIKE '%SQL%'`                     |
| Case-sensitive match | `WHERE title LIKE BINARY '%SQL%'`              |
| Between range        | `WHERE price BETWEEN 20 AND 30`                |
| In list              | `WHERE category IN ('Tech','HR')`              |
| Subquery             | `WHERE price > (SELECT AVG(price) FROM books)` |

