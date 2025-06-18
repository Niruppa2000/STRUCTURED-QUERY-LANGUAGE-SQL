-- EMPLOYEES WHO HAVE CONSTANTLY RECEIVED A SALARY INCREASE FOR PAST 3 YEARS
SELECT DISTINCT s1.employee_id
FROM salary s1
JOIN salary s2 ON s1.employee_id = s2.employee_id AND s1.year = s2.year - 1
JOIN salary s3 ON s1.employee_id = s3.employee_id AND s1.year = s3.year - 2
WHERE s1.salary < s2.salary AND s2.salary < s3.salary;

-- 2 - CUSTOMERS WHO MADE PURCHASE IN LAST 6 MONTHS BUT NOT IN PREVIOUS 6 MONTHS
SELECT DISTINCT customer_id
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 6 MONTH
AND customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE order_date >= CURDATE() - INTERVAL 12 MONTH
      AND order_date < CURDATE() - INTERVAL 6 MONTH
);

-- 3 - SALES DECREASED MORE THAN 30% COMPARED TO THE PREVIOUS MONTH
SELECT 
  current.product_id,
  current.sale_month,
  current.total_sales AS current_sales,
  previous.total_sales AS previous_sales
FROM sales current
JOIN sales previous 
  ON current.product_id = previous.product_id
  AND current.sale_month = DATE_FORMAT(DATE_ADD(previous.sale_month, INTERVAL 1 MONTH), '%Y-%m')
WHERE current.total_sales < previous.total_sales * 0.7;

-- 4- 3 MONTH MOVING AVERAGE FOR EACH PRODUCT
SELECT 
  product_id,
  sales_date,
  total_sales,
  AVG(total_sales) OVER (
    PARTITION BY product_id
    ORDER BY sales_date
    ROWS 2 PRECEDING
  ) AS moving_avg_3_months
FROM sales;

-- 5 - DUPLICATE RECORD IN A CUSTOMER TABLE ON EMAIL AND PHONE NUMBER
SELECT email, phone_number, COUNT(*) AS count
FROM customer
GROUP BY email, phone_number
HAVING COUNT(*) > 1;

-- 6- NO SALES FOR 3 CONSECUTIVE MONTHS
SELECT product_id
FROM (
    SELECT product_id, sale_month, total_sales,
           LAG(total_sales, 1) OVER (PARTITION BY product_id ORDER BY sale_month) AS prev1,
           LAG(total_sales, 2) OVER (PARTITION BY product_id ORDER BY sale_month) AS prev2
    FROM sales
) AS sub
WHERE total_sales = 0 AND prev1 = 0 AND prev2 = 0;

