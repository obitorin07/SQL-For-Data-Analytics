/*
Problem:

You have the same emp table. Now, you need to find the top 3 highest-paid employees in each department. 

Write a SQL query that returns the employee name, department, salary, 
and their rank within the department, but only for the top 3 highest-paid employees in each department.


*/

WITH TOP3_EMP AS
(
SELECT 
		EMP_NAME ,
		DEPARTMENT,
		SALARY,
		RANK,
		ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS TOP_EMP
FROM EMP)

SELECT * FROM TOP3_EMP WHERE TOP_EMP <=3;