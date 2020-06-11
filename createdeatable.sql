DROP TABLE cse532.dea_ny;

CREATE TABLE cse532.dea_ny
  ( REPORTER_DEA_NO 			VARCHAR(30) NOT NULL,
	REPORTER_BUS_ACT 			VARCHAR(30) NOT NULL,
	REPORTER_NAME 				VARCHAR(60)	NOT NULL,
	REPORTER_ADDL_CO_INFO 		VARCHAR(60),
	REPORTER_ADDRESS1 			VARCHAR(80) NOT NULL,
	REPORTER_ADDRESS2 			VARCHAR(80),
	REPORTER_CITY 				VARCHAR(40)	NOT NULL,
	REPORTER_STATE 				VARCHAR(25)	NOT NULL,
	REPORTER_ZIP 				VARCHAR(25)	NOT NULL,
	REPORTER_COUNTY 			VARCHAR(40)	NOT NULL,
	BUYER_DEA_NO 				VARCHAR(30) NOT NULL,
	BUYER_BUS_ACT 				VARCHAR(30)	NOT NULL,
	BUYER_NAME 					VARCHAR(80)	NOT NULL,
	BUYER_ADDL_CO_INFO 			VARCHAR(60),
	BUYER_ADDRESS1 				VARCHAR(80)	NOT NULL,
	BUYER_ADDRESS2 				VARCHAR(80),
	BUYER_CITY 					VARCHAR(50)	NOT NULL,
	BUYER_STATE 				VARCHAR(25)	NOT NULL,
	BUYER_ZIP 					VARCHAR(10)	NOT NULL,
	BUYER_COUNTY 				VARCHAR(40)	NOT NULL,
	TRANSACTION_CODE 			VARCHAR(25) NOT NULL,
	DRUG_CODE 					VARCHAR(10),
	NDC_NO 						VARCHAR(40)	NOT NULL,
	DRUG_NAME 					VARCHAR(30)	NOT NULL,
	QUANTITY 					INT,
	UNIT 						VARCHAR(10),
	ACTION_INDICATOR 			VARCHAR(25),
	ORDER_FORM_NO 				VARCHAR(30),
	CORRECTION_NO 				VARCHAR(30),
	STRENGTH 					VARCHAR(30),
	TRANSACTION_DATE 			DATE NOT NULL,
	CALC_BASE_WT_IN_GM 			DECIMAL(25,10) NOT NULL,
	DOSAGE_UNIT 				INT DEFAULT NULL,    							 
	TRANSACTION_ID 				INT,
	Product_Name 				VARCHAR(50)	NOT NULL,
	Ingredient_Name 			VARCHAR(50)	NOT NULL,
	Measure 					VARCHAR(10)	NOT NULL,
	MME_Conversion_Factor 		DECIMAL(25,10) NOT NULL,
	Combined_Labeler_Name 		VARCHAR(50),    					 
	Reporter_family 			VARCHAR(50)	NOT NULL,
	dos_str 					VARCHAR(40), 					 
	MME 						DECIMAL(25,10) NOT NULL
	)COMPRESS YES;


  