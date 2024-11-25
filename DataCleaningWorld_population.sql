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