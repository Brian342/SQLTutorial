-- CREATE TABLE
-- 	country_list(Country VARCHAR(255));
--     
-- INSERT INTO
-- 	Country_list(Country)
SELECT DISTINCT
	Country_name,
    Time_Period,
	Pct_managed_drinking_water_services AS pct_access_to_water
FROM
	united_nations.Access_to_basic_services
WHERE Time_period = 2020;