
-- 5. Orders placed by specific EmployeeID
-- Show all the orders placed by a specific employee. The
-- EmployeeID for this Employee (Steven Buchanan) is 5.

select * from ORDERs

select order_id , order_date
from orders 
where employee_id = 5