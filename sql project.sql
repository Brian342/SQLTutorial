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

# using CTE to remove duplicate
WITH cte_duplicate AS
(
	SELECT *,
	ROW_NUMBER() OVER(
    PARTITION BY Brand, `Store Number`, `Store Name`, `Ownership Type`,`Street Address`, 
    City, `State/Province`, Country,Postcode, `Phone Number`, Timezone, Longitude, Latitude) As row_num
	FROM dup_soccer_table
)
SELECT *
	FROM cte_duplicate
    WHERE row_num > 1
;
# No duplicate values on this dataset
CREATE TABLE `dup_soccer_table2` (
  `Brand` text,
  `Store Number` text,
  `Store Name` text,
  `Ownership Type` text,
  `Street Address` text,
  `City` text,
  `State/Province` text,
  `Country` text,
  `Postcode` text,
  `Phone Number` text,
  `Timezone` text,
  `Longitude` double DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
	FROM dup_soccer_table2
;

INSERT INTO dup_soccer_table2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY 
	Brand, `Store Number`, `Store Name`, `Ownership Type`,`Street Address`, 
    City, `State/Province`, Country, Postcode, `Phone Number`, Timezone, Longitude, Latitude) As row_num
FROM dup_soccer_table
;

SELECT *
	FROM dup_soccer_table2
WHERE row_num > 1
;
# Delete the duplicate value
DELETE
	FROM dup_soccer_table2
WHERE row_num > 1
;

# check if the data is deleted
SELECT *
	FROM dup_soccer_table2
WHERE row_num > 1
;


-- 2. Standardize the data(finding issues in the dataset and handling them)



































































































































