/* here it will return data by desc order by total first it group by location then department then counts */

select location , department, count(*) as total from people_information group by location , department order by total desc;
