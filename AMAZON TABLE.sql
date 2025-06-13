CREATE DATABASE AMAZONDB;
USE AMAZONDB;
-- CREATE TABLE FOR USERS.
CREATE TABLE USERS(
       user_id INT PRIMARY KEY  AUTO_INCREMENT,
       name  VARCHAR(100) NOT NULL ,
       email VARCHAR(150) UNIQUE NOT NULL ,
       registered_date DATE NOT NULL ,
       membership ENUM('Basic' , 'Prime')DEFAULT 'Basic'
);
 SELECT * FROM USERS;      
 -- CREATE PRODUCT TABLE.
 CREATE TABLE PRODUCTS(
		PRODUCT_ID INT AUTO_INCREMENT PRIMARY KEY,
        NAME VARCHAR(200) NOT NULL ,
        PRICE DECIMAL(10 ,2) NOT NULL,
        CATEGORY VARCHAR(100) NOT NULL,
        STOCK INT NOT NULL
);
  -- CREATE ORDERS TABLE.
  CREATE TABLE ORDERS(
        ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
        USER_ID INT NOT NULL ,
        ORDER_DATE DATE NOT NULL ,
        TOTAL_AMOUNT DECIMAL(10 ,2) NOT NULL ,
        FOREIGN KEY (USER_ID) REFERENCES USERS(user_id)
);
        
   -- CREATE TABLE ORDERDETAILS.
   CREATE TABLE ORDERDETAILS(
        ORDER_DETAILS_ID INT AUTO_INCREMENT PRIMARY KEY,
        ORDER_ID INT NOT NULL,
        PRODUCT_ID INT NOT NULL,
        QUANTITY INT NOT NULL,
        FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
        FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);
  
  INSERT INTO Users (name, email, registered_date, membership) VALUES
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic'); 

INSERT INTO Products (name, price, category, stock) VALUES
('Echo Dot', 49.99, 'Electronics', 120),
('Kindle Paperwhite', 129.99, 'Books', 50),
('Fire Stick', 39.99, 'Electronics', 80),
('Yoga Mat', 19.99, 'Fitness', 200),
('Wireless Mouse', 24.99, 'Electronics', 150); 

INSERT INTO Orders (user_id, order_date, total_amount) VALUES
(1, '2024-05-01', 79.98),
(2, '2024-05-03', 129.99),
(1, '2024-05-04', 49.99),
(3, '2024-05-05', 24.99);

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 5, 1); 

SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM ORDERDETAILS;
