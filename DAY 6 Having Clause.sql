-- DAY 6
-- The HAVING clause is used to filter the results of groups created by the GROUP BY clause. Unlike the WHERE clause, which filters rows before grouping, HAVING filters groups after aggregation.

/*SELECT column1, column2, aggregate_function(column3)
FROM table_name
GROUP BY column1, column2
HAVING condition;*/



/*Difference Between WHERE and HAVING ⚙
Aspect	            WHERE Clause	                                HAVING Clause
Purpose	     Filters rows before grouping.	                Filters groups after aggregation.
Usage	       Can’t use aggregate functions directly.        Works with aggregate functions.
Example	     WHERE age > 30                                 HAVING COUNT(*) > 5*/


-- Create the sales table
CREATE TABLE sales (
    salesperson VARCHAR(50),
    region VARCHAR(50),
    sales_amount INT
);

-- Insert data into the sales table
INSERT INTO sales (salesperson, region, sales_amount) VALUES
('Alice', 'North', 5000),
('Bob', 'South', 7000),
('Alice', 'North', 3000),
('Bob', 'South', 2000),
('Carol', 'East', 8000);


-- Create the students table
CREATE TABLE students (
    class CHAR(1),
    student_name VARCHAR(50),
    score INT
);

-- Insert data into the students table
INSERT INTO students (class, student_name, score) VALUES
('A', 'John', 85),
('A', 'Mary', 90),
('B', 'Jake', 70),
('B', 'Emily', 75),
('A', 'Steve', 95);

-- To find regions with total sales greater than 10,000:
select region , sum(sales_amount) as total from sales
 group by region
 having total > 10000;

-- To find salespersons who have made more than 1 sale and whose total sales exceed 6,000:
select salesperson , count(*) as no_of_sales , sum(sales_amount) as total  
from sales 
group by salesperson 
having no_of_sales>1 and total >6000;

-- To find regions where the average sales amount is greater than 4000:
select region , avg(sales_amount) as avg_sales from sales
group by region 
having avg_sales > 4000;

-- To find classes with more than 2 students:
select class , count(*) as countof from students 
group by class 
having countof > 2 ;

-- Given a table orders with columns customer_id, order_date, and order_total, write a query to find customers whose total order value exceeds $5000.
select customer_id , sum(order_total) as total from orders
group by customer_id
having total >5000;
-- Use the HAVING clause to filter products from a products table where the average price is greater than $50.
select name , avg(price) as average  from products 
group by name 
having average > 50;

-- Write a query to find departments in a company table where the total salary of employees exceeds $100,000.
select emp_dept , sum(emp_salary) as total from employee
group by emp_dept 
having total > 100000;
