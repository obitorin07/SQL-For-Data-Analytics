/* For all the employees in the Employees table, show the
FirstName, LastName, Title, and BirthDate. Order the
results by BirthDate, so we have the oldest employees
first*/


select
concat(first_name , ' ',last_name) as name ,
title,
birth_date
from employees
order by birth_date;