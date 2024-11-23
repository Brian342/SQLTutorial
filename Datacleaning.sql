-- Data cleaning

SELECT *
FROM layoffs 
;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null Values or Blank values
-- 4. Remove Any columns


# create table
CREATE TABLE layoffs_staging
LIKE layoffs
;


SELECT *
FROM layoffs_staging
;

INSERT layoffs_staging
SELECT *
FROM layoffs
;

# Removing Duplicates

SELECT *,
row_number() OVER(
PARTITION BY
	company, industry, total_laid_off, percentage_laid_off, 'date') AS row_num
FROM layoffs_staging
;

WITH duplicate_cte AS
(
SELECT *,
row_number() OVER(
PARTITION BY
	company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging

)
SELECT *
FROM duplicate_cte
WHERE row_num > 1
;

SELECT *
FROM layoffs_staging
WHERE company = 'Oyster'
;




-- Deleting the duplicate row
WITH duplicate_cte AS
(
SELECT *,
row_number() OVER(
PARTITION BY
	company, location, industry, total_laid_off, percentage_laid_off, 
    'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging

)
SELECT *
FROM duplicate_cte
WHERE row_num > 1
;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



SELECT *
FROM layoffs_staging2
;

INSERT INTO layoffs_staging2
SELECT *,
row_number() OVER(
PARTITION BY
	company, location, industry, total_laid_off, percentage_laid_off, 
    'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1
;

-- delete the duplicate data 
DELETE
FROM layoffs_staging2
WHERE row_num > 1
;
-- Checking if they have been deleted 
SELECT *
FROM layoffs_staging2
WHERE row_num > 1
;

-- Standardizing Data = finding issues in your data and handling them
-- SELECT DISTINT(company)
SELECT company, (TRIM(company)) AS trimmed
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET company = TRIM(company)
;


SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1
;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%'
;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LiKE 'Crypto%';


-- location
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1
;


-- country
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1
;


SELECT *
FROM layoffs_staging2
WHERE country LIKE 'United States%'
ORDER BY 1
;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1
;


UPDATE layoffs_staging2 
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%'
;


-- date
SELECT `date`,
str_to_date(`date`, '%m/%d/%Y')
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y')
;

SELECT `date`
FROM layoffs_staging2
;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` date
;

SELECT *
FROM layoffs_staging2
;


-- 4. Remove Any columns

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;


DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

SELECT *
FROM layoffs_staging2
;

ALTER table layoffs_staging2
DROP column row_num
;


-- 3. Null Values or Blank values
-- industry

UPDATE layoffs_staging2
set industry = null
where industry = ''
;

SELECT  industry
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = ''
;

select *
from layoffs_staging2
-- where company = 'Airbnb'
where company LIKE 'Bally%'

;


select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null
;


UPDATE layoffs_staging2 t1
join layoffs_staging2 t2
	ON t1.industry = t2.company
SET t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null
    
































































