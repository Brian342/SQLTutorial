use databasesoccer
;

SELECT *
	FROM databasesoccer.directory
;

-- Data Cleaning Steps to Follow
-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null Values or Blank values
-- 4. Remove Any columns

-- Remove Duplicates

# creating a duplicate table to work on the dataset
CREATE TABLE dup_soccer_table
LIKE databasesoccer.directory
;

SELECT *
	FROM dup_soccer_table
;

# insert details to the table
INSERT dup_soccer_table
SELECT *
	FROM databasesoccer.directory
;

# removing the duplicates
SELECT *,
	ROW_NUMBER() OVER(
    PARTITION BY Brand, `Store Number`, `Store Name`, `Ownership Type`,`Street Address`, City, `State/Province`, Country,Postcode, `Phone Number`, Timezone, Longitude, Latitude) As row_num
	FROM dup_soccer_table
;































































































































