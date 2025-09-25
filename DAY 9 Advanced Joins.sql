-- Advanced joins build upon the basic join concepts by introducing more complex techniques for combining tables. These joins are particularly useful when working with hierarchical, multi-dimensional, or interrelated datasets.

-- Self Join 
-- A self join is a regular join where a table is joined with itself. This is useful for comparing rows within the same table.
use college;
select * from employee;
-- To find employees and their managers:
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.emp_id;

-- Cross join
-- A cross join returns the Cartesian product of two tables. Every row in the first table is combined with every row in the second table.
use practice;
select a.author_name , b.title 
from authors a 
cross join books b;

-- To calculate total sales by customer:
select c.customer_name , sum(o.order_total) as total_sales 
from customers c
inner join orders o 
on c.customer_id = o.customer_id
group by customer_name;




-- Write a query using a self join to find pairs of employees who share the same manager.
SELECT 
    e1.emp_name AS Employee1,
    e2.emp_name AS Employee2,
    e1.manager_id AS ManagerID
FROM 
    employee e1
JOIN 
    employee e2 ON e1.manager_id = e2.manager_id
WHERE 
    e1.emp_id < e2.emp_id;
-- Use a full outer join to list all products and their orders, including products without orders.
select p.product_name , o.order_id
from products2 p 
left join orders2 o
on p.product_id =o.product_id
union 
select p.product_name , o.order_id
from products2 p 
right join orders2 o
on p.product_id = o.product_id;
-- Write a cross join query to generate all possible pairs of customers and regions from a customers and regions table.
SELECT 
    c.customer_id,
    c.customer_name,
    r.region_id,
    r.region_name
FROM 
    customers c
CROSS JOIN 
    regions r;
-- Combine joins with aggregates to calculate average order amounts for each product.
SELECT 
    p.product_id,
    p.product_name,
    AVG(o.order_amount) AS avg_order_amount
FROM 
    orders o
JOIN 
    products p ON o.product_id = p.product_id
GROUP BY 
    p.product_id, p.product_name;
-- Write a query joining three tables to find detailed order summaries (e.g., customer name, product name, and total amount).
SELECT 
    c.customer_name,
    p.product_name,
    SUM(o.order_amount) AS total_amount
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    products p ON o.product_id = p.product_id
GROUP BY 
    c.customer_name, p.product_name;
