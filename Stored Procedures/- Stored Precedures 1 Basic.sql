-- OLIST_DB USED HERE
-- NOW IM TRYING TO EXPLORE ABOUT THE STORED PROCEDURES

SELECT *  FROM ORDERS;
SELECT *  FROM ORDERS;

CREATE TABLE daily_order_report (
    order_date DATE,
    total_orders INT
);

SELECT * FROM DAILY_ORDER_REPORT;

CREATE OR REPLACE PROCEDURE prepare_daily_order_report(report_date DATE)
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO daily_order_report
    SELECT
        DATE(order_purchase_timestamp) AS order_date,
        COUNT(*) AS total_orders
    FROM orders
    WHERE DATE(order_purchase_timestamp) = report_date
    GROUP BY DATE(order_purchase_timestamp);

END;
$$;

CALL prepare_daily_order_report('2017-10-02');

select * from daily_order_report;





--  second stored procedures

CREATE TABLE daily_payment_report (
    report_date DATE,
    total_orders INT,
    total_payment NUMERIC(12,2)
);

CREATE OR REPLACE PROCEDURE prepare_daily_payment_report(p_report_date DATE)
LANGUAGE plpgsql
AS $$
BEGIN

    DELETE FROM daily_payment_report
    WHERE report_date = p_report_date;

    INSERT INTO daily_payment_report
    SELECT
        DATE(o.order_purchase_timestamp),
        COUNT(DISTINCT o.order_id),
        SUM(p.payment_value)
    FROM orders o
    JOIN order_payments p
        ON o.order_id = p.order_id
    WHERE DATE(o.order_purchase_timestamp) = p_report_date
    GROUP BY DATE(o.order_purchase_timestamp);

END;
$$;

CALL prepare_daily_payment_report('2017-10-05');

SELECT * FROM daily_payment_report