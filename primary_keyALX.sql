/*Create a Geographical location Table*/
-- CREATE TABLE united_nations.Geographical_Location (
-- 	Country_name VARCHAR(37) PRIMARY KEY,
--     Sub_region VARCHAR(25),
--     Region VARCHAR(32),
--     Land_area NUMERIC(10,2)
-- );

INSERT INTO united_nations.Geographical_Location (Country_name, Sub_region, Region, Land_area)
SELECT
	Country_name,
    Sub_region,
    Region,
    AVG(Land_area) As land_avg
FROM united_nations.Access_to_basic_services
GROUP BY
	Country_name,
    Sub_region,
    Region;