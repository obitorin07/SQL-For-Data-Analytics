SELECT * FROM SUPER_MARKET;

SELECT 
    BRANCH , GENDER , 
    SUM(TOTAL_PRICE) FROM SUPER_MARKET
GROUP BY ROLLUP(BRANCH , GENDER)  ;

SELECT 
    BRANCH , GENDER , 
    SUM(TOTAL_PRICE) FROM SUPER_MARKET
GROUP BY (BRANCH , GENDER)  ;


-- BEHIND HOW IT WORKING 
WITH CTE AS (

    SELECT 
        BRANCH , GENDER , 
        SUM(TOTAL_PRICE) FROM SUPER_MARKET
    GROUP BY BRANCH , GENDER 

UNION ALL
    SELECT 
        BRANCH  , '' , 
        SUM(TOTAL_PRICE) FROM SUPER_MARKET
    GROUP BY BRANCH   
)



SELECT * FROM CTE ;


name and studentid studentid and marks

SELECT T1.NAME FROM TABLE1 AS T1 INNER JOIN TABLE2 T2 ON T1.STUDENTID =T2.STUDENTID
WHERE T2.MARKS > 75;

SELECT NAME FROM TABLE1 WHERE STUDENTID IN(SELECT STUDENTID FROM TABLE2 WHERE MARKS > 75);




--about cube

SELECT 
    BRANCH , GENDER , 
    SUM(TOTAL_PRICE) FROM SUPER_MARKET
GROUP BY cube(BRANCH , GENDER);

-- for specific
-- whetebver null coming is sub total







-- grouping function used to remove null and replace with 1 or 0
-- if value really is null then 0

-- if value is null then it means cube/rollup became 1 for subtotal to avoid confusion



SELECT 
    Grouping(BRANCH) , 
    Grouping(GENDER) , 
    SUM(TOTAL_PRICE) FROM SUPER_MARKET
GROUP BY cube(BRANCH , GENDER);


SELECT
    BRANCH , GENDER,
    Grouping(BRANCH)  as b, 
    Grouping(GENDER)as g , 
    SUM(TOTAL_PRICE) FROM SUPER_MARKET
GROUP BY cube(BRANCH , GENDER);
