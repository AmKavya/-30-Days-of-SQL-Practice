-- Aggregate functions are used to perform calculations on a set of values, returning a single value as a result. These functions are commonly used to summarize data in SQL.

/*Common Aggregate Functions 
Function	       Description	                  Example
COUNT()	Counts the number of rows.           	  COUNT(*)
SUM()	Calculates the total sum of a column.	    SUM(salary)
AVG()	Calculates the average value of a column. AVG(salary)
MIN()	Returns the smallest value in a column.	  MIN(age)
MAX()	Returns the largest value in a column.	  MAX(age)*/

-- To calculate the total salary for each department.
select emp_dept ,sum(emp_salary) as total_salary from employee 
group by emp_dept;
-- Write a query to find the total number of students in each course from a students table.
select course ,count(*) as no_of from student
group by course;
-- Calculate the average salary of employees in each department from an employees table.
select emp_dept ,avg(emp_salary) as total_salary from employee 
group by emp_dept;
-- Find the minimum and maximum price of products in each category from a products table.
select category , max(price) as expensive , min(price) as cheap from products group by category;

-- Count the number of orders placed by each customer from an orders table.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);
INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 101, '2025-09-01'),
(2, 102, '2025-09-02'),
(3, 101, '2025-09-03'),
(4, 103, '2025-09-04'),
(5, 101, '2025-09-05'),
(6, 102, '2025-09-06'),
(7, 104, '2025-09-07'),
(8, 103, '2025-09-08'),
(9, 102, '2025-09-09'),
(10, 101, '2025-09-10');

select customer_id , count(*) as no_of from orders group by customer_id;
