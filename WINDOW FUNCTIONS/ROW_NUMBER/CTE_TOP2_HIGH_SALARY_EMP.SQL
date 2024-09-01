
/*

Problem:

You have the emp table. Find the top 2 highest-paid employees in each department. 
Return the employee’s name, department, salary, and rank within the department.

*/
WITH TOP_TWO AS (
SELECT EMP_NAME,
		DEPARTMENT,
		SALARY,
		RANK,
ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS TOP_E

FROM EMP)
SELECT * FROM TOP_TWO WHERE TOP_E <=2;