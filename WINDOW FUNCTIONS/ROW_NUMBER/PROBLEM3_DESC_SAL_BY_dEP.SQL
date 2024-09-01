/*
Problem:

You have a table named emp with the columns [EMP_NAME], [Gender], [Salary], [department], 
and [rank]. You need to assign a unique row number to each employee within their respective department based on 
their salary in descending order. Employees with higher salaries should have a lower row number.

Write a SQL query to display the employee name, 
department, salary, and the row number assigned to each employee within their department.
*/

SELECT *,
ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS HIGH_SAL
FROM EMP;