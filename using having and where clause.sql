
select location, department ,count(*) from people_information where salary between 25000 and 50000 group by location, department;

select location , department, count(*)  from people_information where salary >25000 group by location , department;

select location , department, max(salary)  from people_information group by location , department having max(salary) >50000;



