use practice;

-- The WHERE clause is used in SQL to filter records that meet specific criteria. Without it, SQL queries would return all rows in the table, which might not be useful for large datasets.

/*SELECT column1, column2, ...
FROM table_name
WHERE condition;*/

create table employee (
emp_id int primary key,
emp_name varchar(100) not null ,
age int ,
emp_dept varchar(100) not null,
emp_salary decimal(10,2)
);

INSERT INTO employee 
 VALUES
(1, 'Amit Sharma', 28, 'Finance', 55000.00),
(2, 'Priya Mehta', 32, 'HR', 60000.00),
(3, 'Rahul Verma', 45, 'IT', 75000.00),
(4, 'Sneha Kulkarni', 29, 'Marketing', 58000.00),
(5, 'Vikram Singh', 38, 'HR', 67000.00),
(6, 'Neha Joshi', 26, 'Sales', 52000.00),
(7, 'Karan Patel', 41, 'IT', 80000.00),
(8, 'Divya Rao', 35, 'Finance', 62000.00);


/*SQL provides several comparison operators for filtering data:

Operator	Description
=	Equal to
<> or !=	Not equal to
>	Greater than
<	Less than
>=	Greater than or equal to
<=	Less than or equal to */

-- Retrieve employees aged 30 or above:
select * from employee where age>=30;

-- Retrieve employees in the IT department:
select * from employee where emp_dept = 'IT';


/*You can combine multiple conditions using logical operators:

AND: All conditions must be true.
OR: At least one condition must be true.
NOT: Negates a condition.*/

-- Retrieve employees aged above 25 in the HR department:
select * from employee where age > 25 and emp_dept='HR';

-- Retrieve employees who are either in IT or Marketing:
select * from employee where emp_dept = 'IT' or 'Marketing';

-- Retrieve employees not in the HR department:
select * from employee where not emp_dept = 'HR';

/*Using WHERE with Pattern Matching (LIKE) 🔄
The LIKE operator is used for pattern matching in SQL. It supports two wildcards:
%: Matches zero or more characters.
_: Matches exactly one character.

If you need advanced matching, MySQL supports regular expressions with REGEXP (or RLIKE).
Some useful ones:
. → Matches any single character
[abc] → Matches any of a, b, or c
[a-z] → Matches any lowercase letter from a to z
^ → Matches the start of string
$ → Matches the end of string
.* → Matches zero or more characters (similar to %)
+ → One or more occurrences
? → Zero or one occurrence */
 
--  Retrieve employees whose names start with 'J':
SELECT * FROM employee
WHERE emp_name LIKE 'K%';

--  Retrieve employees whose contains 'm':
SELECT * FROM employee
WHERE emp_name LIKE '%m%';


SELECT * FROM employee
WHERE emp_name REGEXP '^[A-F]';

SELECT * FROM employee
WHERE emp_name REGEXP '[A-Fa-f]$';


-- To filter rows with NULL values, use the IS NULL or IS NOT NULL operators.

-- Retrieve employees without a specified department:
SELECT * FROM employee
WHERE emp_dept IS NULL;

-- Retrieve employees with a specified department:
SELECT * FROM employee
WHERE emp_dept IS NOT NULL;



-- Retrieve all employees whose age is less than 30.
select * from employee where age <30;
-- Find employees in the Marketing department or aged 35 and above.
select * from employee where age >=30 and emp_dept = 'Marketing';

-- Retrieve employees whose names end with the letter 'n'.
select * from employee where emp_name like '%n';

-- List employees who do not belong to the IT department.
select * from employee where  not emp_dept = 'IT' ;

-- Retrieve employees with non-NULL age values.
select * from employee where age is not null;
