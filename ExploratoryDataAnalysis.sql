-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2
;


SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2
;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

SELECT company, sum(total_laid_off)
FROM layoffs_staging2
-- WHERE company = '%eta'
GROUP BY company
ORDER BY 2 DESC
;


SELECT MIN(`date`), max(`date`)
FROM layoffs_staging2
;

SELECT industry, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC
;


SELECT country, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC
;

-- odering by date
SELECT YEAR(`date`), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC
;


SELECT stage, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC
;

-- working with percentages
SELECT company, AVG(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
;


SELECT substring(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
where  substring(`date`, 1, 7) is not null
group by `MONTH`
order by 1 asc
;

with Rolling_total as
(
SELECT substring(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
where  substring(`date`, 1, 7) is not null
group by `MONTH`
order by 1 asc
)
select `MONTH`, total_off,
sum(total_off) OVER(ORDER BY `MONTH`) AS ROLLING_total
from Rolling_total
;



SELECT company,sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
;


SELECT company, YEAR(`date`), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
;


WITH company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_year_rank AS
(
SELECT *, 
dense_rank() OVER(partition by years order by total_laid_off DESC) AS ranking
FROM company_year
where years is not null
) select *
from company_year_rank
where ranking <= 5
;

























































































