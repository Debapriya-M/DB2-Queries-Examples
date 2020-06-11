DROP TABLE CSE532.ZIPPOP;

CREATE TABLE CSE532.ZIPPOP
  ( ZIP 			VARCHAR(25) NOT NULL, --zip code duplicates present
    COUNTY			INT,  
    GEOID			INT, --can be null
    ZPOP 			INT --population, can be null
	)COMPRESS YES;


  