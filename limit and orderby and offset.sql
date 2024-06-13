
select first_name , last_name , sex ,salary from people_information order by first_name ,salary desc limit 5 offset 2;


-- This will first order data by name in asc then if name found same then go for another condition salary order by desc order means highest to low

-- then limit 5 means display 5 values only top

-- but index start from 2 
