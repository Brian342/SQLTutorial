USE World_population

-- opening the file
SELECT *
FROM world_population
;
-- sorting in ascending order the Dataset according to Rank 
SELECT *
FROM world_population
ORDER BY [Rank] ASC
;

-- cheking the columns
SELECT Capital
FROM world_population
ORDER BY [Rank]
;

-- Removing speical characters on the Capital column
GO -- Start of the removing special char on data set and also end of the select scrip
CREATE FUNCTION dbo.removecharontheCapitalcolumn(@capitalInput NVARCHAR(MAX))
RETURNS NVARCHAR(Max)
AS
BEGIN
        DECLARE @capitalOutput NVARCHAR(MAX) = '';
        DECLARE @i INT = 1;
        DECLARE @char NCHAR(1);
        DECLARE @prevchar NCHAR(1) = '';

        WHILE @i <= LEN(@capitalInput)
        BEGIN
            SET @char = SUBSTRING(@capitalInput, @i, 1);
            -- Add a space if the current char is uppercase and the previous char is lowercase
            if @char COLLATE Latin1_General_BIN LIKE '[A-Z]'
                AND @prevchar COLLATE Latin1_General_BIN LIKE '[a-z]'
            BEGIN
                SET @capitalOutput = @capitalOutput + ' '; 
            END

            IF @char LIKE '[a-zA-Z0-9]'
                SET @capitalOutput = @capitalOutput + @char;
            ELSE
                SET @capitalOutput = @capitalOutput + '  ';

            -- update the previous character and increment the index
            SET @prevchar = @char;
            SET @i = @i + 1;
        END
        RETURN LTRIM(RTRIM(@capitalOutput));
END;

GO -- end of the function

UPDATE world_population
SET Capital = dbo.removecharontheCapitalcolumn(Capital);

SELECT Country,Capital
FROM world_population
WHERE Capital LIKE '%Nay%'
;

SELECT TRIM(Capital)AS trimmed
FROM world_population
WHERE Capital LIke '%Nay%'
;
