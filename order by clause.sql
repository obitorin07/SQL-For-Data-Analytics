-- order by clause
-- default asc order A-Z
select * from ds_emp order by experience_level ;
-- "experience_level"
-- "Entry Level"
-- "Entry Level"
-- "Entry Level"
-- "Entry Level"

select * from ds_emp order by experience_level desc;
-- in reverse order
-- "experience_level"
-- "Senior"
-- "Senior"
-- "Senior"
-- "Senior"

select * from people_information;

select first_name from people_information order by first_name;
-- "first_name"
-- "Aaron"
-- "Aaron"
-- "Aaron"
-- "Aaron"
-- "Aaron"
