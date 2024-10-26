-- 14. How many customers?
-- How many customers do we have in the Customers table?
-- Show one value only, and don’t rely on getting the
-- recordcount at the end of a resultset
select count(*) as total_customers from customers;