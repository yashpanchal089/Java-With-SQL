# 📚 Database Normalization: 1NF, 2NF & 3NF

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Database+Normalization+%F0%9F%93%9A;1NF;+2NF;+3NF;+Reduce+Redundancy)](https://git.io/typing-svg)

Normalization = Organizing a database to **reduce redundancy** and **improve data integrity**.  
This example uses a **bookstore database**.

---

## 🔹 1. Denormalized Table (Before Normalization)

```sql
CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE book_orders (
    order_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    book_isbn VARCHAR(20),
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10, 2),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10, 2)
);

-- Sample data
INSERT INTO book_orders VALUES
(1, 'John Smith', 'john@example.com', '123 Main St, Anytown', '978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99, '2023-01-15', 1, 9.99),
(2, 'John Smith', 'john@example.com', '123 Main St, Anytown', '978-0451524935', '1984', 'George Orwell', 12.99, '2023-01-15', 2, 25.98),
(3, 'Mary Johnson', 'mary@example.com', '456 Oak Ave, Somewhere', '978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 14.99, '2023-01-20', 1, 14.99),
(4, 'Robert Brown', 'robert@example.com', '789 Pine Rd, Nowhere', '978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99, '2023-01-25', 1, 9.99);

SELECT * FROM book_orders;
```
- Observation:
    - Data is repeated for customers and books.
    - total_price is derived, causing redundancy.
    - Not suitable for efficient updates.

## 🔹 2. First Normal Form (1NF)

- Requirements:
    1. Each column contains atomic values (no multi-values).
    2. Each column contains same type of data.
    3.  Each row is unique (use primary key).
    4.  No repeating groups of columns.
```sql
CREATE TABLE book_orders_1nf (
    order_id INT,
    book_isbn VARCHAR(20),
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    book_title VARCHAR(200),
    book_author VARCHAR(100),
    book_price DECIMAL(10, 2),
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, book_isbn)
);
```

- Explanation:
  - Composite key `(order_id, book_isbn)` ensures each row is unique.
  - No repeating or multi-value columns.

## 🔹 3. Second Normal Form (2NF)

- Requirements:
  1. Must satisfy 1NF.
  2. All non-key attributes must depend on the full primary key.

Remove partial dependencies.
```sql
-- Orders table
CREATE TABLE orders_2nf (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_address VARCHAR(255),
    order_date DATE
);

-- Books table
CREATE TABLE books_2nf (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Order Items table
CREATE TABLE order_items_2nf (
    order_id INT,
    book_isbn VARCHAR(20),
    quantity INT,
    total_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, book_isbn),
    FOREIGN KEY (order_id) REFERENCES orders_2nf(order_id),
    FOREIGN KEY (book_isbn) REFERENCES books_2nf(isbn)
);
```

Sample Data:
```sql
INSERT INTO orders_2nf VALUES
(1, 'John Smith', 'john@example.com', '123 Main St, Anytown', '2023-01-15'),
(2, 'Mary Johnson', 'mary@example.com', '456 Oak Ave, Somewhere', '2023-01-20'),
(3, 'Robert Brown', 'robert@example.com', '789 Pine Rd, Nowhere', '2023-01-25');

INSERT INTO books_2nf VALUES
('978-0141439518', 'Pride and Prejudice', 'Jane Austen', 9.99),
('978-0451524935', '1984', 'George Orwell', 12.99),
('978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 14.99);

INSERT INTO order_items_2nf VALUES
(1, '978-0141439518', 1, 9.99),
(1, '978-0451524935', 2, 25.98),
(2, '978-0061120084', 1, 14.99),
(3, '978-0141439518', 1, 9.99);
```
 - Explanation:
   - Customer info moved to orders_2nf.
   - Book info moved to books_2nf.
   - order_items_2nf links orders and books with quantity and total price.

## 🔹 4. Third Normal Form (3NF)

- Requirements:
   - Must satisfy 2NF.
   - Remove transitive dependencies:
   - Non-key columns must depend only on primary key.
   - No column should depend on another non-key column.
```sql
-- Customers table
CREATE TABLE customers_3nf (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- Orders table
CREATE TABLE orders_3nf (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers_3nf(customer_id)
);

-- Books table
CREATE TABLE books_3nf (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Order Items table
CREATE TABLE order_items_3nf (
    order_id INT,
    book_isbn VARCHAR(20),
    quantity INT,
    PRIMARY KEY (order_id, book_isbn),
    FOREIGN KEY (order_id) REFERENCES orders_3nf(order_id),
    FOREIGN KEY (book_isbn) REFERENCES books_3nf(isbn)
);
```

- Notes:
    - total_price removed (can calculate quantity * price).
    - Each table has single responsibility.
    - Redundancy minimized; integrity improved.

**✅ Summary Table**

->  Normal Form	Purpose	Example Action
- 1NF	Atomic values, unique rows	Split multi-values into separate rows
- 2NF	Remove partial dependency	Move book info to separate table
- 3NF	Remove transitive dependency	Separate customer info into another table

**💡 Real-Life Analogy**

- 1NF: Keep each piece of information in its own box.
- 2NF: Don’t repeat customer or book info in every order.
- 3NF: Don’t store info that can be calculated elsewhere (like total price).
