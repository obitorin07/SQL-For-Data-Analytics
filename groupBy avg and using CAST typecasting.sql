-- type casting float value to integer

select location, cast(avg(salary) as int) as average from people_information group by location;
