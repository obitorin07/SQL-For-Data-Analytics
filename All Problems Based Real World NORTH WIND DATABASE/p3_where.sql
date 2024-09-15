-- 3. Sales Representatives
-- We’d like to see just the FirstName, LastName, and
-- HireDate of all the employees with the Title of Sales
-- Representative. Write a SQL statement that returns only
-- those employees.

select * from employees


SELECT CONCAT(firsT_name , ' ' , last_name) as name,
hire_date
from employees
where title = 'Sales Representative';
