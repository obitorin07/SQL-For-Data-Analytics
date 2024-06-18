-- it will create an view it doesnt required any physical hardware to store it stores in virtually
create view IT_employees as select * from employees1 where emp_department = 'IT';

select * from it_employees;