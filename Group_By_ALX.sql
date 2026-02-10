use united_nations;
SELECT 
	Region,
    Sub_region,
    MAX(Pct_managed_drinking_water_services) AS max_Pct_managed_drinking_water_services,
    MIN(Pct_managed_drinking_water_services) AS min_Pct_managed_drinking_water_services,
    AVG(Pct_managed_drinking_water_services) AS avg_Pct_managed_drinking_water_services,
    COUNT(DISTINCT Country_name) AS Number_of_countries,
    SUM(Est_gdp_in_billions) AS sum_Est_gdp_in_billions
FROM
	Access_to_basic_services
WHERE Time_period =2020
AND  Pct_managed_drinking_water_services < 60
GROUP BY
	Region, Sub_region
HAVING sum_Est_gdp_in_billions < 4
ORDER BY
	sum_Est_gdp_in_billions ASC;