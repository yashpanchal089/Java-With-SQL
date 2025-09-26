
# 📘 SQL Data Types (Detailed Guide)

SQL data types define the kind of values a column can store in a database table.  
They are broadly categorized as:  
1. **Numeric Types**  
2. **String (Character) Types**  
3. **Date & Time Types**  
4. **Binary Types**

---

## 1️⃣ Numeric Data Types

| Data Type      | Storage | Signed Range | Unsigned Range | Description | Example |
|----------------|---------|--------------|----------------|-------------|---------|
| **TINYINT**    | 1 byte  | -128 to 127  | 0 to 255       | Very small integers, saves space | Age (0–120) |
| **SMALLINT**   | 2 bytes | -32,768 to 32,767 | 0 to 65,535 | Small integers | Year, small counts |
| **MEDIUMINT**  | 3 bytes | -8,388,608 to 8,388,607 | 0 to 16,777,215 | Medium integers | Order IDs |
| **INT/INTEGER**| 4 bytes | -2,147,483,648 to 2,147,483,647 | 0 to 4,294,967,295 | Standard integer | Employee ID |
| **BIGINT**     | 8 bytes | Very large (-9 quintillion to +9 quintillion) | 0 to 18 quintillion | Large integers | Population count |
| **FLOAT(p)**   | 4 bytes | Approximate decimals | Approximate decimals | Stores decimal values with limited precision | 123.45 |
| **DOUBLE**     | 8 bytes | More precise decimals | More precise decimals | High precision floating-point | 123456.789 |
| **DECIMAL(p,s)** | Varies | User-defined | User-defined | Exact numeric with precision (p = digits, s = decimals) | DECIMAL(10,2) for money |

🔑 **Tips:**  
- Use **INT** for IDs, counts.  
- Use **DECIMAL** for money (avoids rounding errors).  
- Use **FLOAT/DOUBLE** for scientific values.  

---

## 2️⃣ String (Character) Data Types

| Data Type       | Max Size | Storage | Best Use | Notes | Example |
|-----------------|----------|---------|----------|-------|---------|
| **CHAR(n)**     | 0–255    | Fixed (n) bytes | Fixed-length strings | Pads with spaces | `CHAR(2)` for US state codes |
| **VARCHAR(n)**  | Up to 65,535 | Variable (length + 1–2 bytes) | General text storage | Most common | `VARCHAR(255)` for names |
| **TEXT**        | 65,535   | Length + 2 bytes | Large text | Can’t have default value | Product descriptions |
| **MEDIUMTEXT**  | ~16 MB   | Length + 3 bytes | Medium articles | Can impact performance | Blog posts |
| **LONGTEXT**    | ~4 GB    | Length + 4 bytes | Very large text | Use carefully | Documents |
| **TINYTEXT**    | 255      | Length + 1 byte | Small text | Rarely used | Comments |
| **ENUM**        | Up to 65,535 values | 1–2 bytes | Fixed choice list | Good for small sets | ENUM('Active','Inactive') |
| **SET**         | Up to 64 members | 1–8 bytes | Multiple choices | Stores multiple values | SET('Mon','Tue','Wed') |

🔑 **Tips:**  
- Use **VARCHAR** for flexible text.  
- Use **ENUM/SET** only for very controlled lists.  
- Avoid **LONGTEXT** unless necessary (performance-heavy).  

---

## 3️⃣ Date & Time Data Types

| Data Type   | Storage | Range | Description | Example |
|-------------|---------|-------|-------------|---------|
| **DATE**    | 3 bytes | `1000-01-01` to `9999-12-31` | Stores only date | `2025-01-01` |
| **DATETIME**| 8 bytes | `1000-01-01 00:00:00` to `9999-12-31 23:59:59` | Date + time | `2025-01-08 12:00:00` |
| **TIMESTAMP**| 4 bytes | `1970-01-01` to `2038-01-19` | Date + time, stored in UTC | `2025-01-08 12:00:00` |
| **TIME**    | 3 bytes | `-838:59:59` to `838:59:59` | Stores only time | `12:34:56` |
| **YEAR**    | 1 byte  | 1901–2155 | Stores year | `2025` |

🔑 **Tips:**  
- Use **DATE** for birthdays.  
- Use **DATETIME** for event logs.  
- Use **TIMESTAMP** if you need auto-updates with time zones.  

---

## 4️⃣ Binary Data Types

| Data Type   | Description | Example |
|-------------|-------------|---------|
| **BINARY(n)**     | Fixed-length binary data | `BINARY(16)` for UUID |
| **VARBINARY(n)**  | Variable-length binary data | File hash |
| **TINYBLOB**      | Up to 255 bytes | Small files |
| **BLOB**          | Up to 65 KB | Images, small media |
| **MEDIUMBLOB**    | Up to 16 MB | Larger files |
| **LONGBLOB**      | Up to 4 GB | Videos, very large objects |

🔑 **Tips:**  
- Use **BLOBs** for images, audio, or videos.  
- Avoid storing huge files directly in DB (better in cloud storage + reference).  

---

## ✅ Quick Summary

- **Numeric** → TINYINT, INT, BIGINT, DECIMAL, FLOAT  
- **String** → CHAR, VARCHAR, TEXT, ENUM, SET  
- **Date/Time** → DATE, DATETIME, TIMESTAMP, TIME, YEAR  
- **Binary** → BLOB, BINARY, VARBINARY  
