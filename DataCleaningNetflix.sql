USE Netflix;
-- Data cleaning on the Netflix dataset
SELECT *
FROM netflix1;

-- order the show_id_cleaning column
SELECT Show_id_cleaning
FROM netflix1
ORDER BY CAST(SUBSTRING(Show_id_cleaning, 3, LEN(Show_id_cleaning) -2)AS INT);
/*SUBSTRING(Show_id_cleaning, 3, LEN(Show_id_cleaning) - 2):
Starting position for the substring (skips the first two characters: ss).
LEN(Show_id_cleaning) - 2: Calculates how many characters are left after the first two.
For ss100, 5 - 2 = 3. This ensures the substring captures only the numeric part (100).*/
ALTER TABLE netflix1
ADD numericShowId INT;

UPDATE netflix1
SET  numericShowId =  CAST(SUBSTRING(Show_id_cleaning, 3, LEN(Show_id_cleaning) -2)AS INT);

SELECT *
FROM netflix1
ORDER BY numericShowId ;

WITH OrderData AS(
    SELECT *,
            ROW_NUMBER() OVER (ORDER BY numericShowId) AS NewOrder
    FROM netflix1
)
UPDATE netflix1
SET [type] = od.type
    -- column3 = CAST('Unchaged' AS bigint)
FROM netflix1
JOIN OrderData od ON netflix1.Show_id_cleaning = od.Show_id_cleaning;


-- column [type]
--group by
SELECT *
FROM netflix1
ORDER BY numericShowId ;

SELECT [type], COUNT(release_year) total_count_year, MAX(release_year) max_year, MIN(release_year) Min_year, AVG(release_year) average_year
FROM netflix1
GROUP BY [type]

-- trim function
SELECT TRIM([type]) trimmed
FROM netflix1
ORDER BY numericShowId ;

-- Column3
SELECT *
FROM netflix1
ORDER BY numericShowId ;

ALTER TABLE netflix1
DROP COLUMN column3;



-- Title_cleaning_removing_special_cases
SELECT *
FROM netflix1
ORDER BY numericShowId ;

-- trim
SELECT TRIM(Title_cleaning_Removing_Special_Cases)
FROM netflix1

-- Removing special characters
-- !@#$%^&*()_+-=[]{}|;:",.<>?/\\
-- Method 1
UPDATE netflix1
SET Title_cleaning_Removing_Special_Cases = 
        REPLACE(
        REPLACE(Title_cleaning_Removing_Special_Cases, '(', ''),')', '');

SELECT *
FROM netflix1
;

GO -- end of the first script

-- using a function
CREATE FUNCTION dbo.removespecialcharwithspaces (@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @output NVARCHAR(MAX) = '';
    DECLARE @i INT = 1;
    DECLARE @CHAR NCHAR(1);

    WHILE @i <= LEN(@input)
    BEGIN 
        SET @CHAR = SUBSTRING(@input, @i, 1);
        IF @CHAR LIKE '[a-zA-Z0-9]'
            SET @output = @output + @CHAR;
            -- replaces special characters with a single space
        ELSE
            SET @output = @output + ' ';
        SET @i = @i + 1;
    END

    RETURN LTRIM(RTRIM(REPLACE(@output, '  ', ' ')));
END;


 Go -- end of the function script

 UPDATE netflix1
 set Title_cleaning_Removing_Special_Cases = dbo.removespecialcharwithspaces(Title_cleaning_Removing_Special_Cases);

 SELECT *
 FROM netflix1;

 -- Droping empty rows
 DELETE FROM netflix1
 WHERE TRIM(Title_cleaning_Removing_Special_Cases) = '';

  SELECT *
 FROM netflix1;



-- director column
SELECT director
FROM netflix1;

-- where clause showing movie titles that dont have director names
SELECT Title_cleaning_Removing_Special_Cases, director
FROM netflix1
WHERE director = 'Not Given';

-- removing special charaters
SELECT director
FROM netflix1
ORDER BY numericShowId;

GO -- end of the select script

CREATE FUNCTION dbo.directorcolumn(@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
        -- retuns null if null is present
        IF @input IS NULL
        RETURN NULL;

    DECLARE @output NVARCHAR(MAX) = '';
    DECLARE @i INT = 1;
    DECLARE @CHAR NCHAR(1); 
    
    WHILE @i <= LEN(@input)
    BEGIN
        SET @CHAR = SUBSTRING(@input, @i, 1);
            IF @CHAR LIKE '[a-zA-Z0-9]'
                SET @output = @output + @CHAR
            SET @i = @i + 1;
    END
    RETURN @output
END;

GO -- end of the director function

UPDATE netflix1
set director = dbo.directorcolumn(director);

SELECT Title_cleaning_Removing_Special_Cases, director
FROM netflix1
;

SELECT *
FROM netflix1
ORDER BY numericShowId;


-- Country

SELECT country
FROM netflix1
ORDER BY numericShowId
;


SELECT DISTINCT country
FROM netflix1
ORDER BY country
;

SELECT country
FROM netflix1
WHERE country = ''
;

UPDATE netflix1
SET country = REPLACE(country, 'Not Given', '')
WHERE country = 'Not given'
;
-- Droping Empty spaces
DELETE FROM netflix1
WHERE TRIM(country) =  '';
;

-- group by
SELECT country
FROM netflix1
GROUP BY country
;


-- date_added
-- checking the data type
SELECT DISTINCT date_added
FROM netflix1
;
-- adding a new column and spliting the year from date
ALTER TABLE netflix1
ADD year_added BIGINT;

UPDATE netflix1
SET year_added = YEAR(date_added)

SELECT year_added
FROM netflix1
GROUP BY year_added
;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'netflix1' AND COLUMN_NAME = 'date_added';

-- changing the date_added data type
ALTER TABLE netflix1
ALTER COLUMN date_added DATE;

SELECT DISTINCT *
FROM netflix1
ORDER BY numericShowId
;

-- release year
SELECT release_year
FROM netflix1
;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'netflix1' AND COLUMN_NAME = 'release_year'
;


-- rating
SELECT *
FROM netflix1
ORDER BY numericShowId
;

SELECT rating
FROM netflix1
ORDER BY rating
;

-- duration
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'netflix1' AND COLUMN_NAME = 'duration'
;

SELECT duration
FROM netflix1
ORDER BY numericShowId
;
/*
This 2 commented code extract the integer values on the code cool but not what i need i want to 
extract the number and the words too.

-- SELECT 
--     CAST(substring(duration, 1, CHARINDEX(' ', duration) -1) AS INT) AS Seasons
-- FROM netflix1
-- WHERE duration LIKE '%Season%'
-- ;

-- SELECT 
--     CAST(substring(duration, 1, CHARINDEX(' ', duration) -1) AS INT) AS MIN 
-- FROM netflix1
-- WHERE duration LIKE '%min%'
-- ;
*/

SELECT 
    substring(duration, 1,  8)  AS Seasons
FROM netflix1
WHERE duration LIKE '%Season%'
;

SELECT
    SUBSTRING(duration, 1, 7) AS Minutes
FROM netflix1
WHERE duration LIKE '%min%'
;

-- creating a column to input the seasons and minutes on there respective columns
ALTER TABLE netflix1 ADD Seasons  INT(MAX);
ALTER TABLE netflix1 ADD Minutes  INT(MAX);

ALTER TABLE netflix1
ALTER COLUMN Seasons VARCHAR(MAX);

ALTER TABLE netflix1
ALTER COLUMN MINUTES VARCHAR(MAX);
-- updating the column
UPDATE netflix1
    SET Seasons = CASE
                    WHEN duration LIKE '%Season%'
                    THEN SUBSTRING(duration, 1, 8) 
                END,
    [Minutes] = CASE
                WHEN duration LIKE '%MIN%'
                THEN SUBSTRING(duration, 1, 7)
                END
;
 



-- listed_in
SELECT listed_in AS Actions
FROM netflix1
WHERE listed_in LIKE '%Action%'
ORDER BY numericShowId
;
SELECT listed_in AS Drama
FROM netflix1
WHERE listed_in LIKE '%Drama%'
;

SELECT listed_in AS Documentaries
FROM netflix1
WHERE listed_in LIKE '%Documen%'
;
ALTER TABLE netflix1 ADD Action_movies VARCHAR(MAX);
ALTER TABLE netflix1 ADD Drama_movies VARCHAR(MAX);
ALTER TABLE netflix1 ADD Documentaries VARCHAR(MAX);

UPDATE netflix1
    SET Action_movies = CASE
                        WHEN listed_in LIKE '%Action%' THEN listed_in
                        ELSE NULL
                    END,
        Drama_movies = CASE
                        WHEN listed_in LIKE '%Drama%' THEN listed_in
                        ELSE NULL
                    END,
        Documentaries = CASE
                        WHEN listed_in LIKE '%Documen%' THEN listed_in
                        ELSE NULL
                    END;

-- SELECT DISTINCT TRIM(value) AS genre
-- FROM (
--         SELECT STRING_SPLIT(listed_in, ',') AS VALUE
--         FROM netflix1        
-- ) AS genres
-- ;


-- Column12
SELECT column12
FROM netflix1
WHERE column12 IS NULL
;

UPDATE netflix1
SET Seasons = COALESCE(Seasons,'')
WHERE Seasons IS NULL
;



ALTER TABLE netflix1
DROP COLUMN Column23;

SELECT *
FROM netflix1
ORDER BY numericShowId
;
