-- To do tasks

-- remove Duplicates
-- standardize data
-- handle null and blank values
-- delete unwanted columns

use VgSales;

SELECT *
FROM vgsales_sql;

CREATE TABLE vgsales_sql_cleaning
LIKE vgsales_sql;

INSERT INTO vgsales_sql_cleaning
SELECT *
FROM vgsales_sql
;

SELECT *
FROM vgsales_sql_cleaning;

-- Remove Duplicates values
WITH dublicateValue_cte AS
(
SELECT *,
Row_number() OVER(
PARTITION BY 
	`Rank`, `Name`, Platform, `Year`, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales) AS row_num
FROM vgsales_sql_cleaning
)
SELECT *
FROM dublicateValue_cte
WHERE row_num > 1
;

CREATE TABLE `vgsales_sql_cleaning2` (
  `Rank` int DEFAULT NULL,
  `Name` text,
  `Platform` text,
  `Year` int DEFAULT NULL,
  `Genre` text,
  `Publisher` text,
  `NA_Sales` double DEFAULT NULL,
  `EU_Sales` double DEFAULT NULL,
  `JP_Sales` double DEFAULT NULL,
  `Other_Sales` double DEFAULT NULL,
  `Global_Sales` double DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM vgsales_sql_cleaning2
;

INSERT INTO  vgsales_sql_cleaning2
SELECT *,
Row_number() OVER(
PARTITION BY 
	`Rank`, `Name`, Platform, `Year`, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales) AS row_num
FROM vgsales_sql_cleaning
;

SELECT *
FROM vgsales_sql_cleaning2
WHERE row_num > 1
;


DELETE 
FROM vgsales_sql_cleaning2
WHERE row_num >2
;
 -- checking if the duplicates have been deleted
SELECT *
FROM vgsales_sql_cleaning2
WHERE row_num > 1
;

SELECT *
FROM vgsales_sql_cleaning2
;
-- Standardization of the data
SELECT Name, TRIM(Name) Trimmed
FROM vgsales_sql_cleaning2
;

UPDATE vgsales_sql_cleaning2
SET Name = TRIM(Name)
;


-- Name
SELECT DISTINCT Name
FROM vgsales_sql_cleaning2
;

-- platform
SELECT DISTINCT Platform
FROM vgsales_sql_cleaning2
ORDER BY 1
;

-- Genre
SELECT DISTINCT Genre
FROM vgsales_sql_cleaning2
ORDER BY 1
;

-- Publisher
SELECT DISTINCT Publisher
FROM vgsales_sql_cleaning2
ORDER BY 1
;

SELECT  DISTINCT Publisher
FROM vgsales_sql_cleaning2
WHERE Publisher LIKE '%989 S%'
;

-- Sony Company Entertainment America(SCEA)
UPDATE vgsales_sql_cleaning2
SET Publisher = 'SCEA'
WHERE Publisher LIKE '%989 S%'
;

UPDATE vgsales_sql_cleaning2
SET Publisher = 'Activision Blizzard'
WHERE Publisher LIKE '%Activision%'
;

SELECT *
FROM vgsales_sql_cleaning2
;
-- Handling null and blank values
SELECT DISTINCT Genre, NA_Sales
FROM vgsales_sql_cleaning2
WHERE NA_Sales = 0

;

-- deleteing columns
ALTER TABLE vgsales_sql_cleaning2
DROP COLUMN row_num
;

-- EDA on the data 
SELECT ROUND(SUM(NA_Sales),2) Total_Na_Sales_per_Genre
FROM vgsales_sql_cleaning2
GROUP BY Genre
;

SELECT ROUND(AVG(NA_Sales),2) Average_Na_Sales_per_Genre
FROM vgsales_sql_cleaning2
GROUP BY Genre
;







