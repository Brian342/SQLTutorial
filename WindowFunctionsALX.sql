-- SELECT
-- 	Sub_region,
--     Country_name,
--     Land_area,
-- 	ROUND(Land_area/ SUM(Land_Area) OVER (PARTITION BY Sub_region)* 100 ) AS Pct_sub_region_land_area
-- FROM
-- 	united_nations.Access_to_basic_services
-- WHERE
-- 	Time_Period = 2020
-- AND Land_area IS NOT NULL;

-- Row_number window function
SELECT
    Country_name,
    Time_Period,
    Pct_managed_drinking_water_services,
	ROW_NUMBER() OVER (PARTITION BY Time_Period ORDER BY Pct_managed_drinking_water_services ASC) AS Rank_of_water_services
FROM
	united_nations.Access_to_basic_services
WHERE Pct_managed_drinking_water_services = 100;


-- Using Rank

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    RANK() OVER( PARTITION BY Time_period
    ORDER BY Pct_managed_drinking_water_services ASC) AS Rank_of_water_services
FROM
    united_nations.Access_to_Basic_Services;


