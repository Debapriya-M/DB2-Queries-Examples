# DB2-Queries-Examples-
Opioid Pills Analysis using IBM DB2 Database Queries


We have used a dataset from Washington Post for opioid pills analysis. The database represents transaction of opioid pills sales by a buyer sold by a provider. We mainly analyze the transactions by the buyers. 

1. Create DEA table, load the data, and create indexes.

1a Create a DEA New York database table with following information (column descriptions) and put the SQL into a file createdeatable.sql:
dea_ny(REPORTER_DEA_NO,REPORTER_BUS_ACT,REPORTER_NAME,REPORTER_ADDL_CO_INFO,REPORTER_ADDRESS1,REPORTER_ADDRESS2,REPORTER_CITY,REPORTER_STATE,REPORTER_ZIP,REPORTER_COUNTY,BUYER_DEA_NO,BUYER_BUS_ACT,BUYER_NAME,BUYER_ADDL_CO_INFO,BUYER_ADDRESS1,BUYER_ADDRESS2,BUYER_CITY,BUYER_STATE,BUYER_ZIP,BUYER_COUNTY,TRANSACTION_CODE,DRUG_CODE,NDC_NO,DRUG_NAME,QUANTITY,UNIT,ACTION_INDICATOR,ORDER_FORM_NO,CORRECTION_NO,STRENGTH,TRANSACTION_DATE,CALC_BASE_WT_IN_GM,DOSAGE_UNIT,TRANSACTION_ID,Product_Name,Ingredient_Name,Measure,MME_Conversion_Factor,Combined_Labeler_Name,Reporter_family,dos_str,MME).
Note that TRANSACTION_DATE needs to be a DATE format. Please make sure your datatypes can support the queries below. 
To save space and improve performance, you can use the COMPRESS option for your table. e.g., create my table(...) 
COMPRESS YES.

1b. Load the csv file into the database by modifying the loading script. Run it as:
db2 -tf load.sql

Validate there were 4,281,954,931 prescription pain pills supplied to New York.
(DOSAGE_UNIT is the total number of pills in a transaction/record.)

1c. Based on queries in 3, create proper indexes to make the queries more efficient (createdeaindexes.sql). Attributes used in predicates and used in GROUP BY are candidates for indexes. 

2. Create and load data for zip code population table (the population in each zip code).

2a. Create a table ZIPPOP (ZIP, COUNTY,  GEOID, ZPOP) on populations of zip codes in NY (createzip.sql). "ZIP" is the zip code, and "ZPOP" is the population of the zip code.  Note that there are duplicated zip codes in the table. Some zip codes have zero populations. 

2b. Create a loading script to load the csv file to the database (zipload.sql). 

3. Write SQL queries. (Note that we are only querying pills by buyers.)

3a. Return monthly counts of pills and smooth counts of pills with a two-month window (preceding one month, following one month) (q3a.sql). DOSAGE_UNIT is the total number of pills in a transaction. 
Draw the two curves with Excel or other drawing tools to show the difference (q3a.jpg). 
Note: 
1) month() and year() functions extract month and year from a DATE datatype respectively. 
2) You may use CONCAT or "||" to concatenate two values. To generate a uniform "yeardate" representation (e.g., 200801), you may also consider to use CASE function.
 3) Consider to use common table expression. 

3b. Find the top five zip codes with most pills sold in terms of MME when normalized by the population in the zip codes, i.e., zip codes with most sold total MME of pills per person (q3b.sql). 
(Hint : write the query with the RANK function). 
(MME is a normalized amount which better represents the total strength of the pills sold in the transaction.)
