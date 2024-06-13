
--group by it will only use when we have aggregate function or it doesnt make sense without aggregate functions


select location,avg(salary)from people_information group by location;