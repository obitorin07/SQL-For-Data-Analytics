--it will update for all rows based on condition this will useful when we have large data

update people_information set location = 
	case
	
	when salary < 15000 then 'Pakistan'
	when salary > 15000 and salary <= 25260 then 'Toronto'
	when salary >25000 	and salary <30000 then 'Sydney'  
	when salary > 30000 and salary <45000 then 'New York'
	when salary between 45250 and 52700 then 'London'
	when salary between 52720 and 62200 then 'Tokyo'
	when salary between 62250 and 71100 then 'Berlin'
	when salary between 72750 and 82000 then 'India'
ELSE 'Dubai'
	END ;