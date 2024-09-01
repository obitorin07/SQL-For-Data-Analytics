/*
Problem:

You need to calculate the cumulative total salary of employees within each department. 
This cumulative salary should be ordered by employee rank (rank) in ascending order.

Write a SQL query that returns the employee name, department, rank, salary, 
and the cumulative total salary for each employee within their department.
*/

SELECT
	EMP_NAME,
	DEPARTMENT,
	RANK,
	SALARY,
	SUM(SALARY) OVER(PARTITION BY DEPARTMENT ORDER BY RANK ) AS RUNNING_TOTAL_SALARY
	FROM 
EMP;
