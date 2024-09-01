
/*
Problem:

You have the emp table. Find the employee with the lowest salary in each department. 
Return the employee's name, department, salary, and rank within the department.
*/

WITH LOW_SALARY_EMPLOYEES AS(
SELECT
		EMP_NAME,
		DEPARTMENT,
		SALARY,
		ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY ASC)AS LOW_sALARY
FROM EMP)

SELECT * FROM LOW_SALARY_EMPLOYEES WHERE LOW_sALARY <=1;