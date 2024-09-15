
-- 4. Sales Representatives in the United States
-- Now we’d like to see the same columns as above, but
-- only for those employees that both have the title of Sales
-- Representative, and also are in the United States

SELECT
concat(title_of_courtesy,  first_name , ' ' , last_name) as name,
hire_date
from employees
where 
title = 'Sales Representative' and country ='USA';