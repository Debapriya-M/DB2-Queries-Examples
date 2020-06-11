-- Return monthly counts of and smooth counts of pills with a two-month window (preceding one month, following one month)

WITH E AS (
SELECT DOSAGE_UNIT, YEAR(TRANSACTION_DATE) ||
CASE 
    WHEN ( CAST( MONTH(TRANSACTION_DATE) AS INT)  < 10 ) 
         THEN '0'  || CAST( MONTH(TRANSACTION_DATE) AS INT)
    ELSE CAST ( MONTH(TRANSACTION_DATE) AS CHAR(2) )
END 
AS YEARDATE
FROM CSE532.DEA_NY),
M (SUM_DOSAGE_UNIT, YEARDATE) AS (
	SELECT SUM(DOSAGE_UNIT), YEARDATE
	FROM E
	GROUP BY(E.YEARDATE) 
)
SELECT M.YEARDATE, M.SUM_DOSAGE_UNIT , 
	   AVG(M.SUM_DOSAGE_UNIT) OVER (ORDER BY M.YEARDATE ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS SMOOTH 
	   FROM M;




-- SELECT YEAR(current date) ||
-- CASE 
--     WHEN (  CAST( MONTH(current date) AS INT)  < 10 ) 
--          THEN '0'  || CAST( MONTH(current date) AS INT)
--     ELSE CAST ( MONTH(current date) AS CHAR(2) )
-- END
-- FROM sysibm.sysdummy1;