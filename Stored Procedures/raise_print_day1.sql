select * from orders limit 5;
select count(*) from orders;

select * from orders where customer_id ='9ef432eb6251297304e76186b10a928d';

--  lets do the same thing 

create or replace procedure specific_cust()
language plpgsql
as $$
begin

select * from orders where customer_id ='9ef432eb6251297304e76186b10a928d';
END;
$$;


call specific_cust();
-- GIVES ERROR

CREATE OR REPLACE PROCEDURE hello_olist()
LANGUAGE plpgsql
AS $$
BEGIN

    RAISE NOTICE 'Hello from Olist';

END;
$$;

CALL hello_olist();



CREATE OR REPLACE procedure kira_message()
LANGUAGE plpgsql
-- START
as $$
BEGIN

RAISE NOTICE 'visit my website : kirananalyst.com';

END;
$$;

call kira_message();


-- MULTIPLE LINE PRINT 

CREATE OR REPLACE PROCEDURE message()
LANGUAGE plpgsql
AS $$
BEGIN

RAISE NOTICE 'Welcome to Kiran Analyst';
RAISE NOTICE 'Learning PostgreSQL Stored Procedures';

END;
$$;

CALL message()