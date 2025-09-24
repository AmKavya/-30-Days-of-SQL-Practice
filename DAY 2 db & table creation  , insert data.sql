/*What is the CREATE Statement? 🏗
The CREATE statement is used to define new database objects such as tables, views, indexes, or databases.*/

-- The CREATE DATABASE statement is used to create a new SQL database.
-- CREATE DATABASE databasename;

/*Basic Syntax of CREATE TABLE 🛠️
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype constraints,
    ...
);*/

/*column1, column2: The names of the columns.
datatype: The data type for each column (e.g., INT, VARCHAR, DATE).
constraints: Optional rules like PRIMARY KEY or NOT NULL.*/


CREATE DATABASE   practice; 
-- to create a databse where all the tables n data will be stored its like a folder 

USE practice;
-- to access the database which you will continue working on 

CREATE TABLE student (
student_id int primary key ,
student_name varchar(50) not null,
age int,
enrollment_date date
);

-- The INSERT INTO statement is used to insert new records in a table.

/*INSERT INTO Syntax
It is possible to write the INSERT INTO statement in two ways:
1. Specify both the column names and the values to be inserted:
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

2. If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. 
However, make sure the order of the values is in the same order as the columns in the table. 
Here, the INSERT INTO syntax would be as follows:
INSERT INTO table_name
VALUES (value1, value2, value3, ...);*/


INSERT INTO student 
VALUES
(1, 'Aarav Mehta', 20, '2023-06-15'),
(2, 'Priya Sharma', 22, '2023-07-01'),
(3, 'Rohan Desai', 19, '2023-07-10'),
(4, 'Sneha Patel', 21, '2023-08-05'),
(5, 'Karan Singh', 23, '2023-08-20'),
(6, 'Neha Verma', 20, '2023-09-01');

DESC student;  -- to show the structure of table
SELECT * FROM student ; -- to retrive data from table 




CREATE TABLE products (
product_id int auto_increment primary key,   -- the key auto increment states to auto generate the number in series default 1 to specify state a number atlast or in alter table 
product_name varchar(100) not null,
price  decimal(10,2),
stock_quantity int 
) auto_increment=101;


INSERT INTO products (product_name, price, stock_quantity)
VALUES
('Laptop', 55000.00, 10),
('Smartphone', 25000.50, 25),
('Headphones', 1999.99, 50),
('Keyboard', 1200.00, 40),
('Mouse', 800.75, 60),
('Monitor', 8500.00, 15),
('Printer', 6500.00, 8),
('Webcam', 1500.00, 20);


select product_name , price from products ;



