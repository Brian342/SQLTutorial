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
CREATE FUNCTION dbo.removecharontheCapital(@capitalInput NVARCHAR(MAX))
RETURNS NVARCHAR(Max)
AS
BEGIN
        DECLARE @capitalOutput NVARCHAR(MAX) = '';
        DECLARE @i INT = 1;
        DECLARE @char NCHAR(1);

        WHILE @i <= LEN(@capitalInput)
        BEGIN
            SET @char = SUBSTRING(@capitalInput, @i, 1);
            IF @char LIKE '[a-zA-Z0-9]'
                SET @capitalOutput = @capitalOutput + @char;
            ELSE
                SET @capitalOutput = @capitalOutput + '  ';
            SET @i = @i + 1;
        END
        RETURN LTRIM(RTRIM(@capitalOutput));
END;

GO -- end of the function

UPDATE world_population
SET Capital = dbo.removecharonCapital(Capital);

SELECT *
FROM world_population
ORDER BY [Rank] ASC
;

