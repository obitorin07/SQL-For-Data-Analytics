
-- AGGREGATE FUNCTION : sum ,min,max,avg,count
select sum(salary) from people_information;

select 
	avg(salary) as average_salary ,
	max(salary) as maximum_salary,
	min(salary) as min_salary ,
	sum (salary) as total_salary ,
	count(salary) as number_of_how_many
from people_information;