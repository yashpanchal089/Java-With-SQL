# 🛠️ SQL Joins Explained with Examples

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=FF5733&lines=SQL+Joins+%F0%9F%9A%80;INNER+JOIN;LEFT+JOIN;RIGHT+JOIN;FULL+JOIN;CROSS+JOIN;SELF+JOIN)](https://git.io/typing-svg)
---
- Joins in SQL are used to combine data from multiple tables based on related columns.
- Think of it like connecting puzzle pieces 🧩, each table has some information, and joins let us bring them together.

**We’ll use a small Online Store example with two tables:**

**Customers Table**
| customer_id | first_name | last_name | city     |
| ----------- | ---------- | --------- | -------- |
| 1           | John       | Smith     | New York |
| 2           | Sarah      | Johnson   | Chicago  |
| 3           | Mike       | Brown     | Dallas   |

**Orders Table**
| order_id | customer_id | product    | amount |
| -------- | ----------- | ---------- | ------ |
| 101      | 1           | Laptop     | 1200   |
| 102      | 2           | Smartphone | 800    |
| 103      | 1           | Headphones | 200    |
| 104      | 4           | Keyboard   | 100    |
---
## 1. 🔗 INNER JOIN

**👉 Returns rows where there’s a match in both tables.**
