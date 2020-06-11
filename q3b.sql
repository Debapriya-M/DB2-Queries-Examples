--To get the top five zip codes with most pills sold in terms of MME when normalized by the population in the zip codes, 
--i.e., zip codes with most sold total MME of pills per person 

WITH R AS (
	SELECT DISTINCT ZIP, ZPOP
	FROM CSE532.ZIPPOP
),
S AS (
	SELECT BUYER_ZIP, SUM(MME) AS MME
	FROM CSE532.DEA_NY 
	GROUP BY BUYER_ZIP
),
N AS (
	SELECT S.BUYER_ZIP, S.MME, R.ZPOP
  	FROM S INNER JOIN R
    ON S.BUYER_ZIP = R.ZIP
),
O ( MME, ZIPCODE, ZPOP ) AS (
	SELECT N.MME, N.BUYER_ZIP, N.ZPOP
	FROM N
),
P ( NORMALIZED_MME, ZIPCODE, ZPOP ) AS (
	SELECT (O.MME/O.ZPOP), O.ZIPCODE, O.ZPOP
	FROM O
	WHERE O.ZPOP > 0
)
SELECT ZIPCODE, ZPOP, NORMALIZED_MME, RANK_MME
     FROM (SELECT P.ZIPCODE, P.ZPOP, P.NORMALIZED_MME, RANK() OVER (ORDER BY P.NORMALIZED_MME DESC) AS RANK_MME
       FROM P) AS RANKED
     WHERE RANK_MME < 6 
     ORDER BY RANK_MME;
