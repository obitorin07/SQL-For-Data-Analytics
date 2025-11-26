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

