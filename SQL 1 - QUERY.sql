CREATE DATABASE SQL1;
USE SQL1;
CREATE TABLE EMPLOYEES(
        EMPLOYEE_ID INT PRIMARY KEY,
        NAME VARCHAR(50),
        AGE INT ,
        SALARY INT,
        DEPARTMENT_ID int
);

INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,AGE,SALARY,DEPARTMENT_ID)
VALUES (1,'JOHN',30, 60000,101),
	   (2,'EMILY',25,48000,102),
       (3,'MICHAEL',40,75000,103),
       (4,'SARA',35,56000,101),
       (5,'DAVID',28,49000,102),
       (6,'ROBERT',45,90000,103),
       (7,'SOPHIA',29,51000,102);

SELECT * FROM EMPLOYEES;   
 CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO departments (department_id, department_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (sale_id, customer_id, amount, sale_date) VALUES
(1, 101, 4500.00, '2023-03-15'),
(2, 102, 5500.00, '2023-03-16'),
(3, 103, 7000.00, '2023-03-17'),
(4, 104, 3000.00, '2023-03-18'),
(5, 105, 6000.00, '2023-03-19');

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 1000),
(2, 'Mobile', 500),
(3, 'Tablet', 300),
(4, 'Headphones', 100),
(5, 'Smartwatch', 200);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_amount INT
);

INSERT INTO orders (order_id, customer_name, order_date, order_amount) VALUES
(1, 'John', '2023-05-01', 500),
(2, 'Emily', '2023-05-02', 700),
(3, 'Michael', '2023-05-03', 1200),
(4, 'Sara', '2023-05-04', 450),
(5, 'David', '2023-05-05', 900),
(6, 'John', '2023-05-06', 600),
(7, 'Emily', '2023-05-07', 750);

SELECT * FROM DEPARTMENTS;
SELECT * FROM SALES;
SELECT * FROM PRODUCTS;

-- 1 - ALL EMPLOYEES SALARY GREATER THAN 60K.
SELECT * FROM EMPLOYEES
WHERE SALARY > 60000;

-- 2 - TOTAL SALES PER CUSTOMER.
SELECT CUSTOMER_ID ,SUM(amount) AS TOTAL_SALES
FROM sales
GROUP BY CUSTOMER_ID;

-- 3 - names and salaries of employees in finance department.

SELECT e.name, e.salary 
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- 4- TOTAL SALE AMOUNT MADE ON '2023-03-17'.
SELECT SUM(AMOUNT) AS TOTAL_SALES
FROM SALES
WHERE SALE_DATE = '2023-03-17';

-- 5 - CUSTOMERS PLACED ORDER OF MORE THAN 600.alter
 SELECT CUSTOMER_NAME
 FROM ORDERS
 WHERE ORDER_AMOUNT > 600;

     