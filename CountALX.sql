use united_nations;
SELECT 
	COUNT(*) AS Number_of_observations,
    MIN(Time_period) AS Min_Time_period,
    MAX(Time_period) AS Max_Time_period,
    COUNT(DISTINCT Country_name) AS Number_of_countries
FROM
Access_to_basic_services;