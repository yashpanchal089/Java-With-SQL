# 📘 SQL Functions Notes
[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=3BB143&lines=SQL+Functions+Notes;String+Functions;Numeric+Functions;Date+Time+Functions;Aggregate+Functions)](https://git.io/typing-svg)

## 1 . String Functions

Used to manipulate and analyze string/text data.

- CONCAT() → Joins two or more strings.
```
SELECT CONCAT(first_name, " ", last_name) AS 'Full Name' FROM employees;
```
- LENGTH() → Returns length of a string.
```
SELECT first_name, LENGTH(first_name) FROM employees;
```

 - UPPER() / LOWER() → Converts text to uppercase/lowercase.
```
SELECT UPPER(first_name), LOWER(first_name) FROM employees;
```

- TRIM() → Removes leading & trailing spaces.
```
SELECT TRIM("   hello   ");
```

 - SUBSTRING() → Extracts part of a string.
```
SELECT SUBSTRING(first_name, 1, 3) FROM employees;
```

- LOCATE() → Finds position of substring.
```
SELECT LOCATE('a', first_name) FROM employees;
```

 - REPLACE() → Replace part of string.
```
SELECT REPLACE(email, "example.com", "yashtech.com") FROM employees;
```

- REVERSE() → Reverse a string.
```
SELECT REVERSE(first_name) FROM employees;
```

- LEFT() / RIGHT() → Extract characters from left/right.
```
SELECT LEFT(first_name, 2), RIGHT(first_name, 2) FROM employees;
```

- ASCII() → ASCII code of character.
```
SELECT ASCII('A');
```

- CHAR_LENGTH() → Length in characters (supports Unicode).
```
SELECT CHAR_LENGTH("नमस्कार");
```

- SOUNDEX() → Compare words by sound (phonetics).
```
SELECT * FROM employees WHERE SOUNDEX("jane") = SOUNDEX(first_name);
```

## 2 . Numeric Functions

Used to perform mathematical calculations.

- ABS() → Absolute value.
```
SELECT ABS(-15);
```

- ROUND() → Round number to decimals.
```
SELECT ROUND(25.6789, 2);
```

- CEIL() / FLOOR() → Round up / down.
```
SELECT CEIL(4.2), FLOOR(4.8);
```

- TRUNCATE() → Cut off decimals.
```
SELECT TRUNCATE(25.6789, 2);
```

- POWER() → Raise to exponent.
```
SELECT POWER(5, 2);
```

- MOD() → Remainder after division.
```
SELECT MOD(10, 3);
```

- SQRT() → Square root.
```
SELECT SQRT(25);
```

- EXP() / LOG() / LOG10() → Exponential & logarithmic.
```
SELECT EXP(2), LOG(2, 8), LOG10(1000);
```

- Trigonometric Functions → SIN(), COS(), TAN().
```
SELECT SIN(30), COS(30), TAN(30);
```

- PI(), RADIANS(), DEGREES()
```
SELECT PI(), RADIANS(180), DEGREES(3.14);
```

- Bitwise Operations → BIT_AND, BIT_OR, BIT_XOR.
```
SELECT BIT_AND(num_value), BIT_OR(num_value) FROM numbers;
```

## 3 . Date & Time Functions

- NOW(), CURRENT_DATE(), CURRENT_TIME()
```
SELECT NOW(), CURRENT_DATE(), CURRENT_TIME();
```

- Extract parts of date
```
SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW());
```

 - DATE_FORMAT() → Custom format.
```
SELECT DATE_FORMAT('2025-01-10', '%W, %M %e, %Y');
```

- DATE_ADD() / DATE_SUB() → Add/subtract intervals.
```
SELECT DATE_ADD('2025-03-01', INTERVAL 7 MONTH);
```

- DATEDIFF() → Difference in days.
```
SELECT DATEDIFF('2025-02-01', '2024-10-01');
```

- UNIX_TIMESTAMP() / FROM_UNIXTIME()
```
SELECT UNIX_TIMESTAMP('2025-03-03');
```

- Filter records in last N days
```
SELECT * FROM orders WHERE order_date >= DATE_SUB(NOW(), INTERVAL 7 DAY);
```

## 4 . Aggregate Functions
 Used to summarize data.
- COUNT() → Number of rows.
```
SELECT COUNT(*) FROM employees WHERE department='HR';
```

- SUM() → Total sum.
```
SELECT SUM(salary) FROM employees WHERE department='HR';
```

- AVG() → Average value.
```
SELECT AVG(salary) FROM employees;
```

- MIN() / MAX() → Minimum & maximum.
```
SELECT MIN(salary), MAX(salary) FROM employees;
```

 -Group By (aggregate per group).
```
SELECT department, COUNT(*) FROM employees GROUP BY department;
```
