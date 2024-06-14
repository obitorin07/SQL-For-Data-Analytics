/*concatenate the two or more string into single these are 3 steps to do and in sql  || this symbol used for concatene two string*/



alter table people_information add column Name varchar;


update people_information set Name = first_name + '' + last_name ;

UPDATE people_information
SET Name = CONCAT(first_name, ' ', last_name);



-- Using || operator for concatenation
UPDATE people_information
SET Name = first_name || ' ' || last_name;