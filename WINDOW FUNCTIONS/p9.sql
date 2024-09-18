/*
Show the FirstName and LastName columns from the
Employees table, and then create a new column called
FullName, showing FirstName and LastName joined
together in one column, with a space in-between
*/

select first_name ,
		last_name,
       concat(first_name , " " , last_name) as full_name from employees;