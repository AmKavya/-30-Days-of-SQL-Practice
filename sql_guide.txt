
---

# **SQL Tutorial – Guide**

---

## **1. SQL HOME & Intro**

**SQL** (Structured Query Language) is a standard language used to communicate with databases. It allows you to **create, read, update, and delete data** (CRUD operations).

**Example DBMS:** MySQL, SQL Server, PostgreSQL, Oracle.

---

## **2. SQL SYNTAX**

Basic structure of SQL commands:

```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1;
```

* Keywords: `SELECT`, `FROM`, `WHERE` etc. (not case-sensitive)
* Statements end with a **semicolon `;`**

---

## **3. SQL SELECT**

Used to fetch data from a database.

```sql
SELECT column1, column2 FROM table_name;
```

* `*` → select all columns:

```sql
SELECT * FROM customers;
```

---

## **4. SQL SELECT DISTINCT**

Removes duplicate rows in a result set.

```sql
SELECT DISTINCT column_name
FROM table_name;
```

---

## **5. SQL WHERE**

Filters records based on a condition.

```sql
SELECT * FROM customers
WHERE country = 'India';
```

* Operators: `=, >, <, >=, <=, <>`

---

## **6. SQL ORDER BY**

Sorts data in ascending (`ASC`) or descending (`DESC`) order.

```sql
SELECT * FROM customers
ORDER BY name ASC;
```

---

## **7. SQL AND, OR, NOT**

Combine multiple conditions:

```sql
SELECT * FROM customers
WHERE country = 'India' AND age > 25;

SELECT * FROM customers
WHERE country = 'India' OR age > 25;

SELECT * FROM customers
WHERE NOT country = 'India';
```

---

## **8. SQL INSERT INTO**

Insert new rows into a table.

```sql
INSERT INTO customers (name, email, age)
VALUES ('John Doe', 'john@example.com', 30);
```

---

## **9. SQL NULL VALUES**

Represents missing or unknown data.

```sql
SELECT * FROM customers
WHERE phone IS NULL;

SELECT * FROM customers
WHERE phone IS NOT NULL;
```

---

## **10. SQL UPDATE**

Modify existing data.

```sql
UPDATE customers
SET age = 31
WHERE name = 'John Doe';
```

---

## **11. SQL DELETE**

Delete records.

```sql
DELETE FROM customers
WHERE name = 'John Doe';
```

---

## **12. SQL SELECT TOP / LIMIT**

Fetch top N records.

* SQL Server:

```sql
SELECT TOP 5 * FROM customers;
```

* MySQL / PostgreSQL:

```sql
SELECT * FROM customers
LIMIT 5;
```

---

## **13. SQL AGGREGATE FUNCTIONS**

Functions to calculate over a set of data.

| Function  | Description   |
| --------- | ------------- |
| `COUNT()` | Count rows    |
| `SUM()`   | Sum of values |
| `AVG()`   | Average       |
| `MIN()`   | Minimum       |
| `MAX()`   | Maximum       |

```sql
SELECT COUNT(*) FROM customers;
SELECT SUM(price) FROM orders;
SELECT AVG(age) FROM customers;
```

---

## **14. SQL LIKE & WILDCARDS**

Search pattern in strings.

```sql
SELECT * FROM customers
WHERE name LIKE 'J%';   -- starts with J
WHERE name LIKE '%n';   -- ends with n
WHERE name LIKE '%oh%'; -- contains 'oh'
```

* `%` → any sequence of characters
* `_` → single character

---

## **15. SQL IN**

Check if value is in a list.

```sql
SELECT * FROM customers
WHERE country IN ('India', 'USA', 'UK');
```

---

## **16. SQL BETWEEN**

Select values within a range.

```sql
SELECT * FROM orders
WHERE price BETWEEN 100 AND 500;
```

---

## **17. SQL ALIASES**

Temporary name for columns or tables.

```sql
SELECT name AS customer_name, age AS customer_age
FROM customers;

SELECT * FROM customers AS c;
```

---

## **18. SQL JOINS**

Combine rows from multiple tables.

### **a) INNER JOIN**

Return rows matching in both tables.

```sql
SELECT orders.id, customers.name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.id;
```

### **b) LEFT JOIN**

All rows from left table, matching right table.

```sql
SELECT customers.name, orders.id
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;
```

### **c) RIGHT JOIN**

All rows from right table, matching left table.

```sql
SELECT customers.name, orders.id
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id;
```

### **d) FULL JOIN** (Not in MySQL, use `UNION` workaround)

Return all rows from both tables.

### **e) SELF JOIN**

Join table with itself.

```sql
SELECT a.name AS Employee, b.name AS Manager
FROM employees a
INNER JOIN employees b
ON a.manager_id = b.id;
```

---

## **19. SQL UNION & UNION ALL**

Combine result sets.

```sql
SELECT name FROM customers
UNION
SELECT name FROM suppliers;

SELECT name FROM customers
UNION ALL
SELECT name FROM suppliers;
```

* `UNION` removes duplicates, `UNION ALL` keeps duplicates.

---

## **20. SQL GROUP BY & HAVING**

Group rows and filter groups.

```sql
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country;

SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country
HAVING COUNT(*) > 5;
```

---

## **21. SQL EXISTS**

Check if subquery returns rows.

```sql
SELECT * FROM customers c
WHERE EXISTS (SELECT * FROM orders o WHERE o.customer_id = c.id);
```

---

## **22. SQL ANY / ALL**

Compare with any/all values from a subquery.

```sql
SELECT * FROM orders
WHERE price > ALL (SELECT price FROM orders WHERE customer_id = 1);

SELECT * FROM orders
WHERE price > ANY (SELECT price FROM orders WHERE customer_id = 1);
```

---

## **23. SQL SELECT INTO**

Create a new table from existing table.

```sql
SELECT * INTO new_customers
FROM customers;
```

---

## **24. SQL INSERT INTO SELECT**

Insert data from one table into another.

```sql
INSERT INTO new_customers (name, email)
SELECT name, email FROM customers;
```

---

## **25. SQL CASE**

Conditional logic in SQL.

```sql
SELECT name,
CASE
  WHEN age < 18 THEN 'Minor'
  WHEN age >= 18 AND age < 60 THEN 'Adult'
  ELSE 'Senior'
END AS age_group
FROM customers;
```

---

## **26. SQL NULL FUNCTIONS**

Handle NULL values.

* `ISNULL(column, value)` – replace NULL (SQL Server)
* `COALESCE(column, value)` – works in most SQL

```sql
SELECT name, COALESCE(phone, 'No Phone') FROM customers;
```

---

## **27. SQL STORED PROCEDURES**

Reusable SQL code blocks.

```sql
CREATE PROCEDURE GetCustomers()
BEGIN
    SELECT * FROM customers;
END;

CALL GetCustomers();
```

---

## **28. SQL COMMENTS**

Add notes in SQL code.

```sql
-- Single line comment
/* Multi-line
   comment */
```

---

## **29. SQL OPERATORS**

* Arithmetic: `+ - * / %`
* Comparison: `= <> > < >= <=`
* Logical: `AND, OR, NOT`
* String: `LIKE, ||` (concat)
* Bitwise: `& | ^`

---

## **30. SQL DATABASE MANAGEMENT**

* **CREATE DB**

```sql
CREATE DATABASE mydb;
```

* **DROP DB**

```sql
DROP DATABASE mydb;
```

* **BACKUP DB** (MySQL example)

```sql
-- From command line
mysqldump -u user -p mydb > backup.sql
```

---

## **31. SQL TABLE MANAGEMENT**

* **CREATE TABLE**

```sql
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    age INT
);
```

* **DROP TABLE**

```sql
DROP TABLE customers;
```

* **ALTER TABLE**

```sql
ALTER TABLE customers
ADD COLUMN phone VARCHAR(20);
```

---

## **32. SQL CONSTRAINTS**

* **NOT NULL** → column cannot be null
* **UNIQUE** → values must be unique
* **PRIMARY KEY** → unique identifier
* **FOREIGN KEY** → link to another table
* **CHECK** → validate values
* **DEFAULT** → default value if none given

```sql
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2) CHECK (amount>0),
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
```

---

## **33. SQL INDEX**

Speeds up data retrieval.

```sql
CREATE INDEX idx_name ON customers(name);
```

---

## **34. SQL AUTO\_INCREMENT**

Automatically increment numbers.

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

---

## **35. SQL DATES**

* `CURDATE()`, `NOW()`, `DATE_ADD()`, `DATE_SUB()`, `DATEDIFF()`

```sql
SELECT CURDATE();        -- current date
SELECT NOW();            -- date & time
SELECT DATE_ADD(NOW(), INTERVAL 5 DAY);
```

---

## **36. SQL VIEWS**

Virtual table based on a query.

```sql
CREATE VIEW customer_orders AS
SELECT c.name, o.id AS order_id
FROM customers c
JOIN orders o ON c.id = o.customer_id;

SELECT * FROM customer_orders;
```

---

## **37. SQL INJECTION**

**Security risk** when user input is not sanitized.

```sql
-- Unsafe
"SELECT * FROM users WHERE name = '" + userInput + "'";

-- Safe (Prepared statements)
```

---

## **38. SQL HOSTING**

Databases can be hosted:

* Locally: MySQL Server, PostgreSQL
* Cloud: AWS RDS, Azure SQL, Google Cloud SQL

---

## **39. SQL DATA TYPES**

Common types:

| Type       | Example               |
| ---------- | --------------------- |
| INT        | 123                   |
| DECIMAL    | 123.45                |
| FLOAT      | 123.456               |
| VARCHAR(n) | 'Text'                |
| TEXT       | Long text             |
| DATE       | '2025-09-24'          |
| DATETIME   | '2025-09-24 22:00:00' |
| BOOLEAN    | TRUE/FALSE            |

---

# **SQL Keywords Reference – Explanation & Syntax**

---

### **A**

**ADD** – Add a column to an existing table.

```sql
ALTER TABLE customers ADD phone VARCHAR(20);
```

**ADD CONSTRAINT** – Add a constraint to a table.

```sql
ALTER TABLE orders ADD CONSTRAINT chk_amount CHECK (amount>0);
```

**ALL** – Compare a value with all values in a subquery.

```sql
SELECT * FROM orders WHERE price > ALL (SELECT price FROM orders WHERE customer_id=1);
```

**ALTER** – Modify table structure.

```sql
ALTER TABLE customers ALTER COLUMN name VARCHAR(150);
```

**ALTER COLUMN** – Modify a column definition (datatype, size).

```sql
ALTER TABLE customers ALTER COLUMN age INT;
```

**ALTER TABLE** – Add, drop, or modify columns and constraints.

```sql
ALTER TABLE orders ADD COLUMN order_date DATE;
```

**AND** – Logical operator.

```sql
SELECT * FROM customers WHERE country='India' AND age>25;
```

**ANY** – Compare a value to any value in a subquery.

```sql
SELECT * FROM orders WHERE price > ANY (SELECT price FROM orders WHERE customer_id=1);
```

**AS** – Rename column or table alias.

```sql
SELECT name AS customer_name FROM customers;
```

**ASC** – Sort ascending.

```sql
SELECT * FROM customers ORDER BY name ASC;
```

---

### **B**

**BACKUP DATABASE** – Create a backup (MySQL via command line).

```bash
mysqldump -u user -p mydb > backup.sql
```

**BETWEEN** – Select values within a range.

```sql
SELECT * FROM orders WHERE price BETWEEN 100 AND 500;
```

---

### **C**

**CASE** – Conditional logic.

```sql
SELECT name, CASE WHEN age<18 THEN 'Minor' ELSE 'Adult' END AS age_group FROM customers;
```

**CHECK** – Add a constraint to validate values.

```sql
ALTER TABLE orders ADD CONSTRAINT chk_amount CHECK (amount>0);
```

**COLUMN** – Used to refer to columns in ALTER or CREATE.

**CONSTRAINT** – Define a constraint (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK).

```sql
CREATE TABLE orders (
 id INT PRIMARY KEY,
 customer_id INT,
 CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(id)
);
```

**CREATE** – Create database objects.

```sql
CREATE TABLE customers (...);
```

**CREATE DATABASE** – Create a new database.

```sql
CREATE DATABASE mydb;
```

**CREATE INDEX** – Create index for faster lookup.

```sql
CREATE INDEX idx_name ON customers(name);
```

**CREATE OR REPLACE VIEW** – Create or update a view.

```sql
CREATE OR REPLACE VIEW customer_orders AS SELECT c.name, o.id FROM customers c JOIN orders o ON c.id=o.customer_id;
```

**CREATE TABLE** – Create a new table.

```sql
CREATE TABLE customers(id INT PRIMARY KEY, name VARCHAR(100));
```

**CREATE PROCEDURE** – Define a stored procedure.

```sql
CREATE PROCEDURE GetCustomers() BEGIN SELECT * FROM customers; END;
```

**CREATE UNIQUE INDEX** – Create index that enforces uniqueness.

```sql
CREATE UNIQUE INDEX idx_email ON customers(email);
```

**CREATE VIEW** – Create a virtual table.

```sql
CREATE VIEW cust_view AS SELECT name, age FROM customers;
```

---

### **D**

**DATABASE** – Used to refer to a database.

```sql
USE mydb;
```

**DEFAULT** – Specify default value for a column.

```sql
CREATE TABLE orders(status VARCHAR(20) DEFAULT 'Pending');
```

**DELETE** – Remove rows.

```sql
DELETE FROM customers WHERE id=1;
```

**DESC** – Sort descending / describe table structure.

```sql
SELECT * FROM customers ORDER BY name DESC;
DESC customers;
```

**DISTINCT** – Remove duplicate rows.

```sql
SELECT DISTINCT country FROM customers;
```

**DROP** – Remove objects.

```sql
DROP TABLE customers;
```

**DROP COLUMN** – Remove a column.

```sql
ALTER TABLE customers DROP COLUMN phone;
```

**DROP CONSTRAINT** – Remove a constraint.

```sql
ALTER TABLE orders DROP CONSTRAINT chk_amount;
```

**DROP DATABASE** – Delete a database.

```sql
DROP DATABASE mydb;
```

**DROP DEFAULT** – Remove default value.

```sql
ALTER TABLE orders ALTER COLUMN status DROP DEFAULT;
```

**DROP INDEX** – Remove index.

```sql
DROP INDEX idx_name ON customers;
```

**DROP TABLE** – Delete table.

```sql
DROP TABLE customers;
```

**DROP VIEW** – Delete a view.

```sql
DROP VIEW cust_view;
```

---

### **E**

**EXEC** – Execute a stored procedure.

```sql
EXEC GetCustomers();
```

**EXISTS** – Check if subquery returns rows.

```sql
SELECT * FROM customers WHERE EXISTS (SELECT * FROM orders WHERE customer_id=customers.id);
```

---

### **F**

**FOREIGN KEY** – Create relationship between tables.

```sql
CREATE TABLE orders (
 customer_id INT,
 FOREIGN KEY (customer_id) REFERENCES customers(id)
);
```

**FROM** – Specify table.

```sql
SELECT name FROM customers;
```

**FULL OUTER JOIN** – Return all rows from both tables (use UNION in MySQL).

```sql
SELECT * FROM a LEFT JOIN b ON a.id=b.id UNION SELECT * FROM a RIGHT JOIN b ON a.id=b.id;
```

---

### **G**

**GROUP BY** – Group rows by column.

```sql
SELECT country, COUNT(*) FROM customers GROUP BY country;
```

**HAVING** – Filter groups.

```sql
SELECT country, COUNT(*) FROM customers GROUP BY country HAVING COUNT(*)>5;
```

---

### **I**

**IN** – Check if value is in a list.

```sql
SELECT * FROM customers WHERE country IN ('India','USA');
```

**INDEX** – Used to create or refer to indexes.

**INNER JOIN** – Returns only matching rows.

```sql
SELECT c.name, o.id FROM customers c INNER JOIN orders o ON c.id=o.customer_id;
```

**INSERT INTO** – Insert rows.

```sql
INSERT INTO customers(name,email) VALUES('John','john@example.com');
```

**INSERT INTO SELECT** – Insert rows from another table.

```sql
INSERT INTO new_customers(name,email) SELECT name,email FROM customers;
```

**IS NULL / IS NOT NULL** – Check NULL values.

```sql
SELECT * FROM customers WHERE phone IS NULL;
SELECT * FROM customers WHERE phone IS NOT NULL;
```

**JOIN / LEFT JOIN / RIGHT JOIN / OUTER JOIN** – Combine tables.

```sql
SELECT * FROM a LEFT JOIN b ON a.id=b.id;
```

---

### **L**

**LIKE** – Pattern matching.

```sql
SELECT * FROM customers WHERE name LIKE 'J%';
```

**LIMIT** – Limit rows returned.

```sql
SELECT * FROM customers LIMIT 5;
```

---

### **N**

**NOT / NOT NULL** – Logical NOT / Not null constraint.

```sql
SELECT * FROM customers WHERE NOT country='India';
CREATE TABLE customers(name VARCHAR(100) NOT NULL);
```

**OR** – Logical OR.

```sql
SELECT * FROM customers WHERE country='India' OR age>25;
```

---

### **O**

**ORDER BY** – Sort result set.

```sql
SELECT * FROM customers ORDER BY name ASC;
```

**OUTER JOIN** – Generic term for LEFT, RIGHT, FULL JOIN.

---

### **P**

**PRIMARY KEY** – Unique identifier for table.

```sql
CREATE TABLE customers(id INT PRIMARY KEY, name VARCHAR(100));
```

**PROCEDURE** – Define stored procedure.

---

### **R**

**RIGHT JOIN** – Return all rows from right table.

```sql
SELECT * FROM customers RIGHT JOIN orders ON customers.id=orders.customer_id;
```

**ROWNUM** – Row number in Oracle.

```sql
SELECT * FROM employees WHERE ROWNUM <= 5;
```

---

### **S**

**SELECT / SELECT DISTINCT / SELECT INTO / SELECT TOP** – Retrieve data.

```sql
SELECT * FROM customers;
SELECT DISTINCT country FROM customers;
SELECT * INTO new_table FROM customers;
SELECT TOP 5 * FROM customers;
```

**SET** – Assign values or variables.

```sql
UPDATE customers SET age=30 WHERE id=1;
```

---

### **T**

**TABLE** – Refer to table.

```sql
DROP TABLE customers;
```

**TOP** – Return top N rows (SQL Server).

```sql
SELECT TOP 5 * FROM customers;
```

**TRUNCATE TABLE** – Remove all rows.

```sql
TRUNCATE TABLE customers;
```

---

### **U**

**UNION / UNION ALL** – Combine queries.

```sql
SELECT name FROM customers UNION SELECT name FROM suppliers;
SELECT name FROM customers UNION ALL SELECT name FROM suppliers;
```

**UNIQUE** – Ensure column values are unique.

```sql
CREATE TABLE customers(email VARCHAR(100) UNIQUE);
```

**UPDATE** – Modify rows.

```sql
UPDATE customers SET age=31 WHERE id=1;
```

**VALUES** – Provide values for INSERT.

```sql
INSERT INTO customers(name,email) VALUES('John','john@example.com');
```

**VIEW** – Virtual table.

```sql
CREATE VIEW cust_view AS SELECT name,age FROM customers;
```

---

### **W**

**WHERE** – Filter rows.

```sql
SELECT * FROM customers WHERE country='India';
```


# **SQL Functions Reference – Explanation & Syntax**

---

## **1️⃣ String Functions**

| Function                             | Description                                         | Syntax & Example                                              |
| ------------------------------------ | --------------------------------------------------- | ------------------------------------------------------------- |
| **ASCII**                            | Returns ASCII value of first character.             | `SELECT ASCII('A'); -- 65`                                    |
| **CHAR\_LENGTH / CHARACTER\_LENGTH** | Returns number of characters in a string.           | `SELECT CHAR_LENGTH('Hello'); -- 5`                           |
| **CONCAT**                           | Concatenates strings.                               | `SELECT CONCAT('Hello',' ','World'); -- 'Hello World'`        |
| **CONCAT\_WS**                       | Concatenates with separator.                        | `SELECT CONCAT_WS('-', '2025','09','24'); -- '2025-09-24'`    |
| **FIELD**                            | Returns index of a value in list.                   | `SELECT FIELD('B','A','B','C'); -- 2`                         |
| **FIND\_IN\_SET**                    | Returns position of string in comma-separated list. | `SELECT FIND_IN_SET('B','A,B,C'); -- 2`                       |
| **FORMAT**                           | Formats a number with decimals.                     | `SELECT FORMAT(1234.567,2); -- '1,234.57'`                    |
| **INSERT**                           | Insert string at specified position.                | `SELECT INSERT('HelloWorld',6,0,'My'); -- 'HelloMyWorld'`     |
| **INSTR**                            | Returns position of substring.                      | `SELECT INSTR('Hello World','World'); -- 7`                   |
| **LCASE / LOWER**                    | Converts string to lowercase.                       | `SELECT LOWER('HELLO'); -- 'hello'`                           |
| **LEFT**                             | Returns leftmost characters.                        | `SELECT LEFT('Hello',3); -- 'Hel'`                            |
| **LENGTH**                           | Returns string length in bytes.                     | `SELECT LENGTH('Hello'); -- 5`                                |
| **LOCATE / POSITION**                | Returns position of substring.                      | `SELECT LOCATE('o','Hello'); -- 5`                            |
| **LPAD**                             | Left-pad string.                                    | `SELECT LPAD('5',4,'0'); -- '0005'`                           |
| **LTRIM**                            | Removes leading spaces.                             | `SELECT LTRIM('  Hello'); -- 'Hello'`                         |
| **MID / SUBSTRING**                  | Extract substring.                                  | `SELECT SUBSTRING('Hello',2,3); -- 'ell'`                     |
| **REPEAT**                           | Repeat string N times.                              | `SELECT REPEAT('Hi',3); -- 'HiHiHi'`                          |
| **REPLACE**                          | Replace substring.                                  | `SELECT REPLACE('Hello World','World','SQL'); -- 'Hello SQL'` |
| **REVERSE**                          | Reverse string.                                     | `SELECT REVERSE('Hello'); -- 'olleH'`                         |
| **RIGHT**                            | Returns rightmost characters.                       | `SELECT RIGHT('Hello',3); -- 'llo'`                           |
| **RPAD**                             | Right-pad string.                                   | `SELECT RPAD('Hi',5,'*'); -- 'Hi***'`                         |
| **RTRIM**                            | Remove trailing spaces.                             | `SELECT RTRIM('Hello  '); -- 'Hello'`                         |
| **SPACE**                            | Returns spaces.                                     | `SELECT CONCAT('A',SPACE(3),'B'); -- 'A   B'`                 |
| **STRCMP**                           | Compare two strings.                                | `SELECT STRCMP('a','b'); -- -1`                               |
| **SUBSTRING\_INDEX**                 | Returns substring before/after delimiter.           | `SELECT SUBSTRING_INDEX('a,b,c',',',2); -- 'a,b'`             |
| **TRIM**                             | Remove leading & trailing spaces.                   | `SELECT TRIM('  Hello  '); -- 'Hello'`                        |
| **UCASE / UPPER**                    | Convert to uppercase.                               | `SELECT UPPER('hello'); -- 'HELLO'`                           |

---

## **2️⃣ Numeric Functions**

| Function                       | Description                        | Syntax & Example                       |
| ------------------------------ | ---------------------------------- | -------------------------------------- |
| **ABS**                        | Absolute value.                    | `SELECT ABS(-5); -- 5`                 |
| **ACOS / ASIN / ATAN / ATAN2** | Trigonometric functions.           | `SELECT ACOS(1); -- 0`                 |
| **AVG**                        | Average of values.                 | `SELECT AVG(price) FROM orders;`       |
| **CEIL / CEILING**             | Round up.                          | `SELECT CEIL(4.2); -- 5`               |
| **COS / COT / SIN / TAN**      | Trig functions.                    | `SELECT SIN(PI()/2); -- 1`             |
| **COUNT**                      | Count rows.                        | `SELECT COUNT(*) FROM customers;`      |
| **DEGREES / RADIANS**          | Convert between degrees & radians. | `SELECT DEGREES(PI()); -- 180`         |
| **DIV**                        | Integer division.                  | `SELECT 10 DIV 3; -- 3`                |
| **EXP**                        | e^x                                | `SELECT EXP(1); -- 2.71828`            |
| **FLOOR**                      | Round down.                        | `SELECT FLOOR(4.8); -- 4`              |
| **GREATEST / LEAST**           | Max/Min among values.              | `SELECT GREATEST(1,5,3); -- 5`         |
| **LN / LOG / LOG10 / LOG2**    | Natural / Base 10 / Base 2 log.    | `SELECT LN(10);`                       |
| **MAX / MIN**                  | Max/min of values.                 | `SELECT MAX(price) FROM orders;`       |
| **MOD**                        | Modulus (remainder).               | `SELECT MOD(10,3); -- 1`               |
| **PI**                         | Returns π.                         | `SELECT PI(); -- 3.14159265`           |
| **POW / POWER**                | Exponentiation.                    | `SELECT POWER(2,3); -- 8`              |
| **RAND**                       | Random number 0-1.                 | `SELECT RAND();`                       |
| **ROUND**                      | Round to decimal.                  | `SELECT ROUND(12.345,2); -- 12.35`     |
| **SIGN**                       | Returns -1,0,1.                    | `SELECT SIGN(-5); -- -1`               |
| **SQRT**                       | Square root.                       | `SELECT SQRT(16); -- 4`                |
| **SUM**                        | Sum of values.                     | `SELECT SUM(price) FROM orders;`       |
| **TRUNCATE**                   | Truncate number.                   | `SELECT TRUNCATE(12.3456,2); -- 12.34` |

---

## **3️⃣ Date Functions**

| Function                                               | Description                          | Example                                                |
| ------------------------------------------------------ | ------------------------------------ | ------------------------------------------------------ |
| **ADDDATE / DATE\_ADD**                                | Add days to date.                    | `SELECT DATE_ADD('2025-09-24',INTERVAL 5 DAY);`        |
| **ADDTIME / SUBTIME**                                  | Add/subtract time.                   | `SELECT ADDTIME('12:00:00','01:30:00'); -- '13:30:00'` |
| **CURDATE / CURRENT\_DATE**                            | Current date.                        | `SELECT CURDATE(); -- '2025-09-24'`                    |
| **CURTIME / CURRENT\_TIME**                            | Current time.                        | `SELECT CURTIME(); -- '22:00:00'`                      |
| **CURRENT\_TIMESTAMP / NOW / SYSDATE**                 | Current date & time.                 | `SELECT NOW();`                                        |
| **DATE**                                               | Extract date from datetime.          | `SELECT DATE('2025-09-24 22:00:00'); -- '2025-09-24'`  |
| **DATEDIFF**                                           | Difference between two dates.        | `SELECT DATEDIFF('2025-09-30','2025-09-24'); -- 6`     |
| **DATE\_FORMAT / TIME\_FORMAT**                        | Format date/time.                    | `SELECT DATE_FORMAT(NOW(),'%Y-%m-%d');`                |
| **DAY / DAYOFMONTH / DAYNAME / DAYOFWEEK / DAYOFYEAR** | Extract day info.                    | `SELECT DAY(NOW());`                                   |
| **EXTRACT**                                            | Extract date part.                   | `SELECT EXTRACT(MONTH FROM NOW());`                    |
| **FROM\_DAYS / TO\_DAYS**                              | Convert days to date / date to days. | `SELECT FROM_DAYS(738000);`                            |
| **HOUR / MINUTE / SECOND / MICROSECOND**               | Extract time part.                   | `SELECT HOUR(NOW());`                                  |
| **LAST\_DAY**                                          | Last day of month.                   | `SELECT LAST_DAY('2025-09-24');`                       |
| **LOCALTIME / LOCALTIMESTAMP**                         | Local date & time.                   | `SELECT LOCALTIMESTAMP();`                             |
| **MAKEDATE / MAKETIME**                                | Create date/time from parts.         | `SELECT MAKEDATE(2025,267);`                           |
| **MONTH / MONTHNAME**                                  | Extract month.                       | `SELECT MONTH(NOW()); -- 9`                            |
| **PERIOD\_ADD / PERIOD\_DIFF**                         | Add months / diff months.            | `SELECT PERIOD_ADD(202509,2);`                         |
| **QUARTER**                                            | Return quarter of year.              | `SELECT QUARTER(NOW());`                               |
| **SEC\_TO\_TIME / TIME\_TO\_SEC**                      | Seconds <-> Time.                    | `SELECT SEC_TO_TIME(3661); -- '01:01:01'`              |
| **TIMEDIFF**                                           | Difference between times.            | `SELECT TIMEDIFF('12:00:00','10:30:00');`              |
| **WEEK / WEEKDAY / WEEKOFYEAR**                        | Week functions.                      | `SELECT WEEK(NOW());`                                  |
| **YEAR / YEARWEEK**                                    | Year functions.                      | `SELECT YEAR(NOW());`                                  |

---

## **4️⃣ Advanced / Utility Functions**

| Function                                                | Description                   | Example                                                                 |
| ------------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------- |
| **BIN**                                                 | Convert to binary.            | `SELECT BIN(5); -- '101'`                                               |
| **BINARY**                                              | Cast string to binary.        | `SELECT BINARY 'abc';`                                                  |
| **CASE**                                                | Conditional expression.       | `SELECT CASE WHEN age>18 THEN 'Adult' ELSE 'Minor' END FROM customers;` |
| **CAST / CONVERT**                                      | Type conversion.              | `SELECT CAST('123' AS UNSIGNED);`                                       |
| **COALESCE**                                            | Return first non-null.        | `SELECT COALESCE(NULL,'Hello'); -- 'Hello'`                             |
| **CONNECTION\_ID**                                      | Current connection ID.        | `SELECT CONNECTION_ID();`                                               |
| **CONV**                                                | Convert number between bases. | `SELECT CONV(10,10,2); -- '1010'`                                       |
| **CURRENT\_USER / SESSION\_USER / SYSTEM\_USER / USER** | Return current user.          | `SELECT CURRENT_USER();`                                                |
| **DATABASE**                                            | Current database name.        | `SELECT DATABASE();`                                                    |
| **IF**                                                  | Conditional.                  | `SELECT IF(1>0,'Yes','No');`                                            |
| **IFNULL / ISNULL**                                     | Replace NULL.                 | `SELECT IFNULL(NULL,'Default');`                                        |
| **LAST\_INSERT\_ID**                                    | Last auto-increment ID.       | `SELECT LAST_INSERT_ID();`                                              |
| **NULLIF**                                              | Return NULL if values equal.  | `SELECT NULLIF(5,5); -- NULL`                                           |
| **VERSION**                                             | Server version.               | `SELECT VERSION();`                                                     |

---

# **SQL Server Functions Reference – Explanation & Syntax**

---

## **1️⃣ String Functions (T-SQL)**

| Function          | Description                                  | Syntax & Example                                           |
| ----------------- | -------------------------------------------- | ---------------------------------------------------------- |
| **ASCII**         | Returns ASCII code of first character.       | `SELECT ASCII('A'); -- 65`                                 |
| **CHAR**          | Returns character for ASCII code.            | `SELECT CHAR(65); -- 'A'`                                  |
| **CHARINDEX**     | Find position of substring.                  | `SELECT CHARINDEX('lo','Hello'); -- 4`                     |
| **CONCAT**        | Concatenate strings.                         | `SELECT CONCAT('Hello',' ','World');`                      |
| **Concat with +** | Concatenate using `+`.                       | `SELECT 'Hello' + ' ' + 'World';`                          |
| **CONCAT\_WS**    | Concatenate with separator.                  | `SELECT CONCAT_WS('-', '2025','09','24'); -- '2025-09-24'` |
| **DATALENGTH**    | Bytes used by string.                        | `SELECT DATALENGTH('Hello'); -- 5`                         |
| **DIFFERENCE**    | Returns difference between SOUNDEX values.   | `SELECT DIFFERENCE('Hello','Hella'); -- 4`                 |
| **FORMAT**        | Format values.                               | `SELECT FORMAT(1234.567,'N2'); -- '1,234.57'`              |
| **LEFT**          | Leftmost characters.                         | `SELECT LEFT('Hello',3); -- 'Hel'`                         |
| **LEN**           | Length of string (ignores trailing spaces).  | `SELECT LEN('Hello '); -- 5`                               |
| **LOWER**         | Convert to lowercase.                        | `SELECT LOWER('HELLO'); -- 'hello'`                        |
| **LTRIM**         | Remove leading spaces.                       | `SELECT LTRIM('  Hello'); -- 'Hello'`                      |
| **NCHAR**         | Returns Unicode character.                   | `SELECT NCHAR(65); -- 'A'`                                 |
| **PATINDEX**      | Returns position of pattern using wildcards. | `SELECT PATINDEX('%lo%','Hello'); -- 4`                    |
| **QUOTENAME**     | Returns string with delimiters.              | `SELECT QUOTENAME('MyTable'); -- '[MyTable]'`              |
| **REPLACE**       | Replace substring.                           | `SELECT REPLACE('Hello World','World','SQL');`             |
| **REPLICATE**     | Repeat string N times.                       | `SELECT REPLICATE('Hi',3); -- 'HiHiHi'`                    |
| **REVERSE**       | Reverse string.                              | `SELECT REVERSE('Hello'); -- 'olleH'`                      |
| **RIGHT**         | Rightmost characters.                        | `SELECT RIGHT('Hello',3); -- 'llo'`                        |
| **RTRIM**         | Remove trailing spaces.                      | `SELECT RTRIM('Hello  '); -- 'Hello'`                      |
| **SOUNDEX**       | Returns phonetic code.                       | `SELECT SOUNDEX('Hello'); -- 'H400'`                       |
| **SPACE**         | Return N spaces.                             | `SELECT 'A'+SPACE(3)+'B'; -- 'A   B'`                      |
| **STR**           | Convert number to string.                    | `SELECT STR(123.45,6,2); -- '123.45'`                      |
| **STUFF**         | Insert/replace string at position.           | `SELECT STUFF('Hello',2,3,'i'); -- 'Hi'`                   |
| **SUBSTRING**     | Extract substring.                           | `SELECT SUBSTRING('Hello',2,3); -- 'ell'`                  |
| **TRANSLATE**     | Replace multiple characters.                 | `SELECT TRANSLATE('abc','abc','xyz'); -- 'xyz'`            |
| **TRIM**          | Remove leading/trailing spaces.              | `SELECT TRIM('  Hello  '); -- 'Hello'`                     |
| **UNICODE**       | Returns Unicode value of first char.         | `SELECT UNICODE('A'); -- 65`                               |
| **UPPER**         | Convert to uppercase.                        | `SELECT UPPER('hello'); -- 'HELLO'`                        |

---

## **2️⃣ Numeric Functions (T-SQL)**

| Function                      | Description                        | Syntax & Example                                 |
| ----------------------------- | ---------------------------------- | ------------------------------------------------ |
| **ABS**                       | Absolute value.                    | `SELECT ABS(-5); -- 5`                           |
| **ACOS / ASIN / ATAN / ATN2** | Trigonometric functions.           | `SELECT ACOS(1); -- 0`                           |
| **AVG**                       | Average.                           | `SELECT AVG(price) FROM orders;`                 |
| **CEILING**                   | Round up.                          | `SELECT CEILING(4.2); -- 5`                      |
| **COUNT**                     | Count rows.                        | `SELECT COUNT(*) FROM customers;`                |
| **COS / COT / SIN / TAN**     | Trigonometric functions.           | `SELECT SIN(PI()/2); -- 1`                       |
| **DEGREES / RADIANS**         | Convert between degrees & radians. | `SELECT DEGREES(PI()); -- 180`                   |
| **EXP**                       | e^x                                | `SELECT EXP(1);`                                 |
| **FLOOR**                     | Round down.                        | `SELECT FLOOR(4.8); -- 4`                        |
| **LOG / LOG10**               | Natural / Base 10 log.             | `SELECT LOG(10); SELECT LOG10(100);`             |
| **MAX / MIN**                 | Maximum / Minimum.                 | `SELECT MAX(price) FROM orders;`                 |
| **PI**                        | Returns π.                         | `SELECT PI(); -- 3.14159265`                     |
| **POWER**                     | Exponentiation.                    | `SELECT POWER(2,3); -- 8`                        |
| **RAND**                      | Random 0-1.                        | `SELECT RAND();`                                 |
| **ROUND**                     | Round to N decimals.               | `SELECT ROUND(12.345,2); -- 12.35`               |
| **SIGN**                      | Returns -1,0,1.                    | `SELECT SIGN(-5); -- -1`                         |
| **SQRT / SQUARE**             | Square root / square.              | `SELECT SQRT(16); -- 4; SELECT SQUARE(4); -- 16` |
| **SUM**                       | Sum of values.                     | `SELECT SUM(price) FROM orders;`                 |

---

## **3️⃣ Date Functions (T-SQL)**

| Function                 | Description                             | Syntax & Example                                                          |
| ------------------------ | --------------------------------------- | ------------------------------------------------------------------------- |
| **CURRENT\_TIMESTAMP**   | Current date & time.                    | `SELECT CURRENT_TIMESTAMP;`                                               |
| **DATEADD**              | Add interval to date.                   | `SELECT DATEADD(DAY,5,'2025-09-24');`                                     |
| **DATEDIFF**             | Difference between dates.               | `SELECT DATEDIFF(DAY,'2025-09-24','2025-09-30'); -- 6`                    |
| **DATEFROMPARTS**        | Create date from parts.                 | `SELECT DATEFROMPARTS(2025,9,24);`                                        |
| **DATENAME**             | Name of date part.                      | `SELECT DATENAME(MONTH,'2025-09-24'); -- 'September'`                     |
| **DATEPART**             | Numeric part of date.                   | `SELECT DATEPART(MONTH,'2025-09-24'); -- 9`                               |
| **DAY / MONTH / YEAR**   | Extract day, month, year.               | `SELECT DAY(GETDATE()); SELECT MONTH(GETDATE()); SELECT YEAR(GETDATE());` |
| **GETDATE / GETUTCDATE** | Current local / UTC date & time.        | `SELECT GETDATE(); SELECT GETUTCDATE();`                                  |
| **ISDATE**               | Check if string is valid date.          | `SELECT ISDATE('2025-09-24'); -- 1`                                       |
| **SYSDATETIME**          | Current datetime with higher precision. | `SELECT SYSDATETIME();`                                                   |

---

## **4️⃣ Advanced / Utility Functions (T-SQL)**

| Function                                         | Description                  | Syntax & Example                                                     |
| ------------------------------------------------ | ---------------------------- | -------------------------------------------------------------------- |
| **CAST / CONVERT**                               | Convert data types.          | `SELECT CAST('123' AS INT); SELECT CONVERT(VARCHAR, GETDATE(), 23);` |
| **COALESCE**                                     | First non-null value.        | `SELECT COALESCE(NULL,'Hello','World'); -- 'Hello'`                  |
| **CURRENT\_USER / SESSION\_USER / SYSTEM\_USER** | Current database/login user. | `SELECT CURRENT_USER, SESSION_USER, SYSTEM_USER;`                    |
| **IIF**                                          | Inline IF statement.         | `SELECT IIF(1>0,'Yes','No'); -- 'Yes'`                               |
| **ISNULL**                                       | Replace NULL.                | `SELECT ISNULL(NULL,'Default');`                                     |
| **ISNUMERIC**                                    | Check if value is numeric.   | `SELECT ISNUMERIC('123'); -- 1`                                      |
| **NULLIF**                                       | Return NULL if values equal. | `SELECT NULLIF(5,5); -- NULL`                                        |
| **SESSIONPROPERTY**                              | Return session property.     | `SELECT SESSIONPROPERTY('language');`                                |
| **USER\_NAME**                                   | Current user name.           | `SELECT USER_NAME();`                                                |

---


# **MS Access Functions Reference – Explanation & Syntax**

---

## **1️⃣ String Functions**

| Function          | Description                             | Syntax & Example                                                    |
| ----------------- | --------------------------------------- | ------------------------------------------------------------------- |
| **Asc**           | Returns ASCII value of first character. | `SELECT Asc("A"); -- 65`                                            |
| **Chr**           | Returns character from ASCII code.      | `SELECT Chr(65); -- "A"`                                            |
| **Concat with &** | Concatenate strings using `&`.          | `SELECT "Hello" & " " & "World"; -- "Hello World"`                  |
| **CurDir**        | Returns current directory path.         | `SELECT CurDir(); -- "C:\Users\..."`                                |
| **Format**        | Format string or value.                 | `SELECT Format(Date(),"yyyy-mm-dd");`                               |
| **InStr**         | Position of substring.                  | `SELECT InStr("Hello","l"); -- 3`                                   |
| **InstrRev**      | Find position from right.               | `SELECT InStrRev("Hello","l"); -- 4`                                |
| **LCase**         | Convert to lowercase.                   | `SELECT LCase("HELLO"); -- "hello"`                                 |
| **Left**          | Leftmost characters.                    | `SELECT Left("Hello",3); -- "Hel"`                                  |
| **Len**           | Length of string.                       | `SELECT Len("Hello"); -- 5`                                         |
| **LTrim**         | Remove leading spaces.                  | `SELECT LTrim("  Hello"); -- "Hello"`                               |
| **Mid**           | Extract substring.                      | `SELECT Mid("Hello",2,3); -- "ell"`                                 |
| **Replace**       | Replace substring.                      | `SELECT Replace("Hello World","World","Access"); -- "Hello Access"` |
| **Right**         | Rightmost characters.                   | `SELECT Right("Hello",3); -- "llo"`                                 |
| **RTrim**         | Remove trailing spaces.                 | `SELECT RTrim("Hello  "); -- "Hello"`                               |
| **Space**         | Return N spaces.                        | `SELECT "A" & Space(3) & "B"; -- "A   B"`                           |
| **Split**         | Split string into array by delimiter.   | `Split("A,B,C",",")(1); -- "B"`                                     |
| **Str**           | Convert number to string.               | `SELECT Str(123.45); -- " 123.45"`                                  |
| **StrComp**       | Compare two strings.                    | `SELECT StrComp("A","B"); -- -1`                                    |
| **StrConv**       | Convert string case.                    | `SELECT StrConv("hello",vbUpperCase); -- "HELLO"`                   |
| **StrReverse**    | Reverse string.                         | `SELECT StrReverse("Hello"); -- "olleH"`                            |
| **Trim**          | Remove leading & trailing spaces.       | `SELECT Trim("  Hello  "); -- "Hello"`                              |
| **UCase**         | Convert to uppercase.                   | `SELECT UCase("hello"); -- "HELLO"`                                 |

---

## **2️⃣ Numeric Functions**

| Function            | Description                       | Syntax & Example                             |
| ------------------- | --------------------------------- | -------------------------------------------- |
| **Abs**             | Absolute value.                   | `SELECT Abs(-5); -- 5`                       |
| **Atn**             | Arctangent.                       | `SELECT Atn(1); -- 0.7854 (π/4)`             |
| **Avg**             | Average of values.                | `SELECT Avg([Price]) FROM Orders;`           |
| **Cos**             | Cosine.                           | `SELECT Cos(0); -- 1`                        |
| **Count**           | Count values.                     | `SELECT Count(*) FROM Customers;`            |
| **Exp**             | Exponential e^x.                  | `SELECT Exp(1); -- 2.71828`                  |
| **Fix**             | Integer part of number.           | `SELECT Fix(4.7); -- 4`                      |
| **Format**          | Format numeric value.             | `SELECT Format(1234.567,"0.00"); -- 1234.57` |
| **Int**             | Integer part (floor).             | `SELECT Int(4.7); -- 4`                      |
| **Max / Min**       | Maximum / Minimum.                | `SELECT Max([Price]) FROM Orders;`           |
| **Randomize / Rnd** | Initialize RNG / generate random. | `Randomize: Rnd();`                          |
| **Round**           | Round number.                     | `SELECT Round(12.345,2); -- 12.35`           |
| **Sgn**             | Sign function.                    | `SELECT Sgn(-5); -- -1`                      |
| **Sqr / Square**    | Square root / square.             | `SELECT Sqr(16); -- 4`                       |
| **Sum**             | Sum of values.                    | `SELECT Sum([Price]) FROM Orders;`           |
| **Val**             | Convert string to number.         | `SELECT Val("123.45"); -- 123.45`            |

---

## **3️⃣ Date Functions**

| Function                   | Description               | Syntax & Example                                                 |
| -------------------------- | ------------------------- | ---------------------------------------------------------------- |
| **Date**                   | Current date.             | `SELECT Date(); -- 2025-09-24`                                   |
| **DateAdd**                | Add interval to date.     | `SELECT DateAdd("d",5,Date());`                                  |
| **DateDiff**               | Difference between dates. | `SELECT DateDiff("d","2025-09-01","2025-09-24"); -- 23`          |
| **DatePart**               | Extract part of date.     | `SELECT DatePart("m",Date()); -- 9`                              |
| **DateSerial**             | Create date from parts.   | `SELECT DateSerial(2025,9,24);`                                  |
| **DateValue**              | Convert string to date.   | `SELECT DateValue("9/24/2025");`                                 |
| **Day / Month / Year**     | Extract day, month, year. | `SELECT Day(Date()); SELECT Month(Date()); SELECT Year(Date());` |
| **Format**                 | Format date.              | `SELECT Format(Date(),"yyyy-mm-dd");`                            |
| **Hour / Minute / Second** | Extract time part.        | `SELECT Hour(Time());`                                           |
| **MonthName**              | Month name.               | `SELECT MonthName(Month(Date()));`                               |
| **Now**                    | Current date & time.      | `SELECT Now();`                                                  |
| **Time**                   | Current time.             | `SELECT Time();`                                                 |
| **TimeSerial**             | Create time from parts.   | `SELECT TimeSerial(14,30,0);`                                    |
| **TimeValue**              | Convert string to time.   | `SELECT TimeValue("14:30:00");`                                  |
| **Weekday / WeekdayName**  | Day of week / name.       | `SELECT Weekday(Date()); SELECT WeekdayName(Weekday(Date()));`   |

---

## **4️⃣ Other Functions**

| Function        | Description                | Syntax & Example                      |
| --------------- | -------------------------- | ------------------------------------- |
| **CurrentUser** | Name of current user.      | `SELECT CurrentUser();`               |
| **Environ**     | Get environment variable.  | `SELECT Environ("USERNAME");`         |
| **IsDate**      | Check if value is date.    | `SELECT IsDate("9/24/2025"); -- True` |
| **IsNull**      | Check if value is Null.    | `SELECT IsNull([FieldName]);`         |
| **IsNumeric**   | Check if value is numeric. | `SELECT IsNumeric("123"); -- True`    |

---






