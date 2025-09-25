
/*Joins are SQL operations that combine rows from two or more tables based on a related column. They help in:
Accessing data distributed across multiple tables.
Creating meaningful associations between data entities.
Simplifying queries for complex datasets.*/

/*Types of Joins 
Join Type	Description
INNER JOIN	Returns records that have matching values in both tables.
LEFT JOIN	Returns all records from the left table and matched records from the right table.
RIGHT JOIN	Returns all records from the right table and matched records from the left table.
FULL OUTER JOIN	Returns all records when there is a match in either left or right table.*/

/*Syntax of Joins 
INNER JOIN Syntax:
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

LEFT JOIN Syntax:
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

RIGHT JOIN Syntax:
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

FULL OUTER JOIN Syntax:
SELECT columns
FROM table1          
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name;*/   -- in mysql theres no keyword as full outer join  hence union of left n right 

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100)
);

INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

CREATE TABLE orders2 (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE
);

INSERT INTO orders2 VALUES
(101, 1, 201, '2025-09-01'),
(102, 2, 202, '2025-09-02'),
(103, 3, 203, '2025-09-03'),
(104, 2, 204, '2025-09-04');


CREATE TABLE products2 (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100)
);

INSERT INTO products2 VALUES
(201, 'Laptop'),
(202, 'Mouse'),
(203, 'Keyboard'),
(204, 'Monitor'),
(205, 'Webcam'); -- No order for this product


CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100),
  location VARCHAR(100)
);

INSERT INTO departments VALUES
(101, 'HR', 'Mumbai'),
(102, 'IT', 'Bangalore'),
(103, 'Marketing', 'Delhi'),
(104, 'Finance', 'Chennai'); -- No employee in this department

CREATE TABLE employees2 (
  employee_id INT PRIMARY KEY,
  name VARCHAR(100),
  department_id INT,
  email VARCHAR(100),
  hire_date DATE
);

INSERT INTO employees2 VALUES
(1, 'John Doe', 101, 'john@company.com', '2022-01-15'),
(2, 'Jane Smith', 102, 'jane@company.com', '2023-03-20'),
(3, 'Sam Brown', 103, 'sam@company.com', '2024-07-10'),
(4, 'Lisa White', NULL, 'lisa@company.com', '2025-01-05');


CREATE TABLE authors (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(100)
);

INSERT INTO authors VALUES
(1, 'George Orwell'),
(2, 'J.K. Rowling'),
(3, 'Agatha Christie');


CREATE TABLE books (
  book_id INT PRIMARY KEY,
  author_id INT,
  title VARCHAR(100)
);

INSERT INTO books VALUES
(101, 1, '1984'),
(102, 1, 'Animal Farm'),
(103, 2, 'Harry Potter'),
(104, NULL, 'Unknown Book'); -- No author assigned

-- To find employees and their department names:
select e.name , d.department_name 
from employees2 e 
inner join departments d 
on e.department_id = d.department_id;
-- To include all employees, even those without a department:
select e.name , d.department_name 
from employees2 e 
left join departments d 
on e.department_id = d.department_id;
-- To include all departments, even those without employees:
select e.name , d.department_name 
from employees2 e 
right join departments d 
on e.department_id = d.department_id;
-- To include all employees and all departments:
select e.name , d.department_name 
from employees2 e 
left join departments d 
on e.department_id = d.department_id
union
select e.name , d.department_name 
from employees2 e 
right join departments d 
on e.department_id = d.department_id;
-- Given a table orders and another table customers, find all orders with their customer names using an INNER JOIN.
select o.order_id , c.customer_name 
from orders2 o
inner join customers c
on o.customer_id = c.customer_id;

-- Use a LEFT JOIN to list all products and their orders from products and orders tables.
select p.product_name , o.order_id 
from orders2 o 
inner join products2 p 
on p.product_id = o.product_id;

-- Create a query to find departments without any employees using a RIGHT JOIN.
SELECT e.name , d.department_name
FROM employees2 e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.name is null;
