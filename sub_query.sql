-- Find the most expensive product:
select * from products where price in (select max(price) from products)
	
SELECT *
FROM products
WHERE price = (SELECT MAX(price) FROM products );
