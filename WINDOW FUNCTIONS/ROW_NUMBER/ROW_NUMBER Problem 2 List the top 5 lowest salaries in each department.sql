/* ROW_NUMBER()
Problem 1: List the top 5 lowest salaries in each department. */

WITH LOW_SALARY AS (
SELECT EMP_NAME , 
GENDER , 
SALARY,
DEPARTMENT,
ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS LOWEST_SALARY
FROM EMP  )

SELECT * FROM LOW_SALARY WHERE LOWEST_SALARY <=5;

