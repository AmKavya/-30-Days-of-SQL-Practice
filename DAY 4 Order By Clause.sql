-- The ORDER BY clause in SQL is used to sort the rows returned by a query based on one or more columns. By default, data is sorted in ascending order unless specified otherwise.

/*Basic Syntax of ORDER BY 
SELECT column1, column2, ...
FROM table_name
ORDER BY column_name [ASC|DESC];*/

-- Ascending order (ASC) is the default sorting order. It arranges data from smallest to largest (for numbers) or alphabetically (for strings).
-- Descending order (DESC) arranges data from largest to smallest (for numbers) or reverse alphabetical order (for strings).
-- You can sort by multiple columns by specifying them in the ORDER BY clause. Sorting is applied in the order the columns are listed.

-- Retrieve all rows from the employees table and sort them by name in ascending order.
select * from employee order by emp_name asc ;

-- Sort the employees table by department in descending order.
select * from employee order by emp_dept desc ;

-- Combine sorting by age in ascending order and department in alphabetical order.
select * from employee order by age asc , emp_dept asc ;

-- Create a query to sort a new table products by price in descending order and stock_quantity in ascending order.
select * from  products order by price desc , stock_quantity asc;
