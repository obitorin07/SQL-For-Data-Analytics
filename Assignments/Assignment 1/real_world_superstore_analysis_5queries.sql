SELECT * FROM SUPERSTORE WHERE RETURNS = 1;

UPDATE SUPERSTORE SET RETURNS = 0 WHERE RETURNS = '#N/A';
ALTER TABLE SUPERSTORE ADD  TOTAL_SALES DECIMAL(10,2);

UPDATE SUPERSTORE SET TOTAL_SALES =  SALES * QUANTITY; 

SELECT * FROM SUPERSTORE;
/*
1. Total Sales by Country
Question:
Write a query to find the total sales amount for each state. 
Display the state and the total Sales, ordered from highest to lowest sales amount.
*/

SELECT STATE,
ROUND(SUM(TOTAL_SALES),2) TOTAL_SALES
FROM SUPERSTORE
GROUP BY STATE ORDER BY TOTAL_SALES DESC;


/*2. Customer Purchase Summary
Question:
Write a query to find the total number of orders and the total amount spent by each customer. 
Display the Customer_ID, Customer_Name, the total number of orders, and 
the total Sales, ordered by the total sales in descending order.
*/

SELECT 

CUSTOMER_NAME ,
CUSTOMER_ID,
COUNT(ORDER_ID)  AS TOTAL_ORDERS,
ROUND(SUM(TOTAL_SALES),2) AS TOTAL_SALES

FROM 
SUPERSTORE
GROUP BY CUSTOMER_NAME ,  CUSTOMER_ID
ORDER BY TOTAL_SALES DESC;


/*
3. Average Profit by Category
Question:
Write a query to find the average profit for each product category. 
Display the Category and the average Profit, 
formatted to 6 decimal places. Order the results by the average profit in descending order.
*/

SELECT 
CATEGORY AS PRODUCT_CATEGORY,
ROUND(AVG(PROFIT), 6) AS AVERAGE_PROFIT
FROM
SUPERSTORE
GROUP BY
CATEGORY
ORDER BY AVERAGE_PROFIT DESC;


/*
4. Top Products by Profit
Question:
Write a query to find the top 10 products with the highest total profit. 
Display the Product_Name, the total Profit, and the total Sales, ordered by total profit in descending order.
*/
SELECT TOP 10
PRODUCT_NAME,
ROUND(SUM(PROFIT),2) AS TOTAL_PROFIT,
ROUND(SUM(TOTAL_SALES),2)AS TOTAL_SALES

FROM
SUPERSTORE
GROUP BY PRODUCT_NAME
ORDER BY TOTAL_PROFIT DESC;


/*
5. Monthly Sales Trend
Question:
Write a query to find the total sales amount for each month in the year 2019. 
Display the year, month, and total Sales, ordered by month.
*/

SELECT MONTH(ORDER_DATE) AS MONTH_2019,
YEAR(ORDER_DATE) AS YEAR_2019,
SUM(TOTAL_SALES) as TOTAL_SALES

FROM SUPERSTORE
WHERE YEAR(ORDER_DATE) = 2019
GROUP BY MONTH(ORDER_DATE),YEAR(ORDER_DATE)
ORDER BY MONTH_2019 ;
