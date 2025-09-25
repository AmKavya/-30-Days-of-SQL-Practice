-- Day 7

-- Task: Write a query to find the total sales for each region.
select region , sum(sales_amount) as total_sales 
from sales 
group by region ;

-- Task: Write a query to find the average score for each class.
select class , avg(score) as average 
from students 
group by class;

-- Problem 3: High-Selling Salespersons
-- Given the same sales table as Problem 1:
-- Task: Write a query to find salespersons with total sales greater than 8000.
select salesperson , sum(sales_amount) as total  from sales
group by salesperson 
having total > 8000;

-- Problem 4: Students with More Than One Entry
-- Given the students table:
-- Task: Write a query to find all students who appear more than once in the table.students
select student_name , count(*) as no_of from students 
group by student_name
having no_of > 1 ;

-- Quiz Questions 🎮
-- Question 1: Filtering with WHERE and HAVING
-- Which of the following statements is true?
-- (A) WHERE filters rows before grouping, while HAVING filters groups after aggregation.
-- (B) HAVING filters rows before grouping, while WHERE filters groups after aggregation.
-- (C) Both WHERE and HAVING filter rows after grouping.
-- (D) None of the above.

-- a)



-- Question 2: Aggregation
-- What will the following query return?
-- SELECT region, COUNT(*) AS region_count
-- FROM sales
-- GROUP BY region;
-- (A) The total number of regions.
-- (B) The count of sales in each region.
-- (C) The count of unique regions.
-- (D) None of the above.

-- b)


-- Question 3: Combining GROUP BY and HAVING
-- Given the following orders table:
-- customer_id	order_amount
-- 1	100
-- 2	200
-- 1	300
-- 2	400
-- 3	500
-- What does this query return?
-- SELECT customer_id, SUM(order_amount) AS total_amount
-- FROM orders
-- GROUP BY customer_id
-- HAVING total_amount > 400;
-- (A) Customers whose total orders exceed 400.
-- (B) Customers with more than one order.
-- (C) The total amount of all orders.
-- (D) None of the above.

-- a)
