-- IT RETURN FIRST RIGHT TABLE THEN IN LEFT TABLE CHECK FOR MATCH IF NOT FOUND THEN 'NULL VALUE'
SELECT * FROM EMPLOYEES1 RIGHT JOIN EMPLOYEES2 ON EMPLOYEES1.EMP_ID = EMPLOYEES2.ID;
