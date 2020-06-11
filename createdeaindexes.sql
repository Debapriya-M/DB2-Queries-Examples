-- Based on queries in 3, creating proper indexes to make the queries more efficient (createdeaindexes.sql). 
--Attributes used in predicates and used in GROUP BY are candidates for indexes. 

CREATE INDEX zip_index
ON CSE532.DEA_NY (TRANSACTION_DATE, BUYER_ZIP);