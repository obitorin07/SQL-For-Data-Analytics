-- this will count how many people are in this particular location

select location , count (*) from people_information group by location;
