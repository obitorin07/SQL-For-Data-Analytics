-- IT RETURN FIRST LEFT TABLE THEN IN RIGHT TABLE CHECK FOR MATCH IF NOT FOUND THEN 'NULL VALUE'
SELECT * FROM EMPLOYEES1 LEFT JOIN EMPLOYEES2 ON EMPLOYEES1.EMP_ID = EMPLOYEES2.ID;
