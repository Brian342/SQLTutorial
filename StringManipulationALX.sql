-- cast function used to change one datatype to another
-- SELECT DISTINCT
-- 	Country_name,
--     Time_period,
--     CAST(Est_population_in_millions AS DECIMAL(6, 2)) AS Est_population_in_millions_2d
-- FROM united_nations.Access_to_basic_services;
-- 	
SELECT DISTINCT
	Country_name,
    Time_period,
    Est_population_in_millions,
    CONCAT (
    IFNULL(Country_name,'unknown'),
    IFNULL(Time_period,'unknown'),
    IFNULL(Est_population_in_millions, 'unknown')
    ) AS Country_id
FROM united_nations.Access_to_basic_services;
