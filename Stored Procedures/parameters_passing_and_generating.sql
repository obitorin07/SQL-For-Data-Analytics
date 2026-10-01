SELECT * FROM ORDERS;

SELECT *
FROM orders
WHERE customer_id = '9ef432eb6251297304e76186b10a928d';

CREATE OR REPLACE procedure parameters(name varchar )
LANGUAGE plpgsql
as $$
BEGIN

raise notice 'Hello How are you ?%',name;

end;
$$;


call parameters('Kira');




select * from orders;


select min(order_purchase_timestamp) as min_Date, max(order_purchase_timestamp) as max_Date from orders;


SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_sales
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_purchase_timestamp >= '2017-10-01'
  AND o.order_purchase_timestamp <  '2018-10-15'
GROUP BY o.order_status
ORDER BY total_sales DESC;



CREATE TABLE weekly_sales_report (
    report_start_date DATE,
    report_end_date DATE,
    order_status VARCHAR,
    total_orders INT,
    total_sales NUMERIC
);



CREATE OR REPLACE PROCEDURE weekly_sales_report_proc ( p_start_date DATE, p_end_date Date)
LANGUAGE plpgsql
as $$
BEGIN
INSERT INTO weekly_sales_report(

	order_status,
	total_orders,
	total_sales,
	report_end_date,
	report_start_date
)
SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_sales,
	p_start_date,
	p_end_date
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_purchase_timestamp::timestamp >= p_start_date
  AND o.order_purchase_timestamp::timestamp <  p_end_date
GROUP BY o.order_status;

end;
$$;



CALL weekly_sales_report_proc('2017-06-01', '2018-06-01')

select * from weekly_sales_report;