SELECT * FROM DS_EMP;

SELECT SALARY FROM DS_EMP;
-- 087 SEC

CREATE INDEX SALARY_DATA ON DS_EMP(SALARY);

SELECT SALARY FROM DS_EMP;
-- 058 SEC

-- IT RETRIEVE DATA QUICKLY 

