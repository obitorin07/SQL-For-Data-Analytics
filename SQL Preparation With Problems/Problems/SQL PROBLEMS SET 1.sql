CREATE TABLE IF NOT EXISTS menu (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    price INTEGER
);

CREATE TABLE IF NOT EXISTS sales (
    customer_id VARCHAR(1),
    order_date DATE,
    product_id INTEGER REFERENCES menu(product_id)
);

CREATE TABLE IF NOT EXISTS members (
    customer_id VARCHAR(1) PRIMARY KEY,
    join_date TIMESTAMP
);

SELECT * FROM SALES;
SELECT * FROM MENU;
SELECT * FROM MEMBERS;


--  What is the total amount each customer spent at the restaurant?
SELECT 
	cust.customer_id AS customer_name,
	SUM(m.price) AS price_spend
FROM members as cust join sales as s on cust.customer_id = s.customer_id
JOIN menu as m on m.product_id = s.product_id
GROUP BY cust.customer_id
order by price_spend desc;

--simple step

SELECT 
	s.customer_id as customer,
	SUM(m.price) as spent
FROM sales as s JOIN menu as m on s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY spe`nt DESC;

--  How many days has each customer visited the restaurant?

SELECT
	customer_id as Customer,
	count(distinct(order_date))as visited_days
FROM sales
GROUP BY customer_id
ORDER BY visited_days DESC;

-- What was the first item from the menu purchased by each customer?
WITH CTE AS (
	SELECT
		s.customer_id as customer,
		m.product_name as product,
		s.order_date as order_date,
		row_number() over(partition by s.customer_id order by s.order_date asc) as earliest_date
	FROM sales as s JOIN menu as m ON s.product_id = m.product_id
	ORDER BY earliest_date
)
SELECT 
	customer,
	product,
	order_date
FROM CTE
WHERE earliest_date = 1;


--  What is the most purchased item on the menu and how
-- many times was it purchased by all customers?

-- WITH CTE AS (
-- SELECT PRODUCT_ID, COUNT(*) AS NUMBER_OF_TIMES FROM SALES
-- GROUP BY PRODUCT_ID ORDER BY NUMBER_OF_TIMES DESC
-- ), FL AS(
-- SELECT *, ROW_NUMBER()OVER(ORDER BY NUMBER_OF_TIMES DESC) AS RN FROM CTE)
-- ,DA  AS(
-- SELECT PRODUCT_ID FROM FL WHERE RN = 1)

-- SELECT S.CUSTOMER_ID, COUNT(DA.PRODUCT_ID)AS PER_CUST FROM SALES AS S JOIN DA ON S.PRODUCT_ID = DA.PRODUCT_ID
-- GROUP BY S.CUSTOMER_ID
-- ORDER BY PER_CUST DESC
WITH CTE AS (
SELECT MENU.PRODUCT_NAME, COUNT(SALES.PRODUCT_ID) AS PRODUCTS FROM MENU JOIN SALES ON
SALES.PRODUCT_ID = MENU.PRODUCT_ID
GROUP BY MENU.PRODUCT_NAME)
,RESULT AS(
SELECT *, ROW_NUMBER()OVER(ORDER BY PRODUCTS DESC)AS RN FROM CTE 
)
SELECT PRODUCT_NAME, PRODUCTS FROM RESULT WHERE RN = 1;


 -- Which item was the most popular for each customer?
 WITH CTE AS (
	SELECT  
	 	M.CUSTOMER_ID, 
		ME.PRODUCT_NAME, 
		COUNT(ME.PRODUCT_NAME) AS popular_item 
	FROM SALES AS S 
	JOIN MEMBERS AS M ON S.CUSTOMER_ID = M.CUSTOMER_ID
	JOIN MENU AS ME ON S.PRODUCT_ID = ME.PRODUCT_ID
	GROUP BY M.CUSTOMER_ID, ME.PRODUCT_NAME ORDER BY popular_item DESC
	),
RESULT AS (
	SELECT 
		*, 
		DENSE_RANK() OVER(PARTITION BY CUSTOMER_ID ORDER BY POPULAR_ITEM DESC) AS RN 
	FROM CTE 
)
SELECT 
	CUSTOMER_ID,
	PRODUCT_NAME,
	POPULAR_ITEM
FROM RESULT 
	WHERE RN = 1
	ORDER BY CUSTOMER_ID ASC, POPULAR_ITEM DESC;	-- USING MEMBER TABLE WAS OPTIONAL BUT I USED IT;


-- Which item was purchased first by the customer after
 -- they became a member?

WITH CTE AS (
	SELECT
		C.CUSTOMER_ID,
		S.ORDER_DATE,
		S.PRODUCT_ID
	FROM SALES AS S 
 		JOIN MEMBERS AS C 
 		ON C.CUSTOMER_ID = S.CUSTOMER_ID AND C.JOIN_DATE <= S.ORDER_DATE
),
RESULT AS (
	SELECT 
		*,
		DENSE_RANK()OVER(PARTITION BY CUSTOMER_ID ORDER BY ORDER_DATE ASC) AS RN 
	FROM CTE
	)
SELECT 
	CUSTOMER_ID, 
	-- R.ORDER_DATE,
	-- R.PRODUCT_ID,
	M.PRODUCT_NAME AS FIRST_PURCHASED_ITEM 
FROM RESULT AS R JOIN MENU AS M ON R.PRODUCT_ID = M.PRODUCT_ID
WHERE RN = 1;	



-- Which item was purchased just before the customer became
-- a member?
WITH CTE AS (
	SELECT
		M.CUSTOMER_ID AS CUSTOMER,
		S.PRODUCT_ID,
		S.ORDER_DATE,
		M.JOIN_DATE
	FROM MEMBERS AS M JOIN SALES AS S ON S.CUSTOMER_ID = M.CUSTOMER_ID
	AND S.ORDER_DATE < M.JOIN_DATE
)
,RESULT AS (
	SELECT 
		CUSTOMER,
		PRODUCT_ID,
		ORDER_DATE,
		JOIN_DATE,
		DENSE_RANK() OVER(PARTITION BY CUSTOMER ORDER BY ORDER_DATE DESC)AS RN
	FROM CTE
)
SELECT 
	R.CUSTOMER AS CUSTOMER,
	M.PRODUCT_NAME AS PRODUCT
	-- R.ORDER_DATE,
	-- JOIN_DATE
FROM RESULT AS R JOIN MENU AS M ON M.PRODUCT_ID = R.PRODUCT_ID
WHERE RN = 1
ORDER BY CUSTOMER;



-- What is the total items and amount spent for each member
-- before they became a member?

WITH CTE AS (
	SELECT
		M.CUSTOMER_ID AS CUSTOMER,
		S.PRODUCT_ID AS PRODUCT_ID
		-- M.JOIN_DATE,
		-- S.ORDER_DATE	
	FROM MEMBERS AS M JOIN SALES AS S ON M.CUSTOMER_ID = S.CUSTOMER_ID AND M.JOIN_DATE > S.ORDER_DATE
)
SELECT 
	CUSTOMER,
	COUNT(C.PRODUCT_ID) AS TOTAL_ITEMS,
	SUM(M.PRICE) AS TOTAL_SPENT
FROM CTE AS C JOIN MENU AS M ON C.PRODUCT_ID = M.PRODUCT_ID
GROUP BY CUSTOMER
ORDER BY CUSTOMER ASC;

-- WITHOUT CTE
SELECT 
    s.customer_id, 
    COUNT(s.product_id) AS total_items, 
    SUM(m.price) AS total_spent
FROM sales AS s
JOIN members AS mem 
    ON s.customer_id = mem.customer_id
    AND s.order_date < mem.join_date 
JOIN menu AS m 
    ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id;



-- If each $1 spent equates to 10 points and sushi has a 2x
-- points multiplier - how many points would each customer
-- have?

SELECT 
	S.CUSTOMER_ID,
	SUM(CASE WHEN PRODUCT_NAME = 'Sushi' THEN PRICE * 20 ELSE PRICE * 10 END) AS MULTUPLIER_AMOUNT
FROM SALES AS S JOIN MENU as M ON S.PRODUCT_ID = M.PRODUCT_ID
GROUP BY S.CUSTOMER_ID
ORDER BY MULTUPLIER_AMOUNT DESC;


-- In the first week after a customer joins the program
-- (including their join date) they earn 2x points on all items, not
-- just sushi - how many points do customers have ?

-- SELECT * FROM SALES AS S JOIN MEMBERS AS M ON M.CUSTOMER_ID = S.CUSTOMER_ID

SELECT
	S.CUSTOMER_ID,
	SUM(
		CASE 
			WHEN S.ORDER_DATE BETWEEN C.JOIN_DATE AND (C.JOIN_DATE + INTERVAL  '6 DAY') THEN M.PRICE * 20
			WHEN UPPER(M.PRODUCT_NAME) = 'SUSHI' THEN M.PRICE * 20
			ELSE M.PRICE * 10
			END
	)	AS TOTAL_POINTS
FROM SALES AS S JOIN MEMBERS AS C ON S.CUSTOMER_ID = C.CUSTOMER_ID 
	JOIN MENU AS M ON M.PRODUCT_ID = S.PRODUCT_ID
GROUP BY S.CUSTOMER_ID
ORDER BY TOTAL_POINTS DESC;