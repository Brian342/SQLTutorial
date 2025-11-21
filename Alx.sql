use united_nations;
-- CREATE DATABASE united_nations;
-- CREATE TABLE united_nations.Access_to_basic_services(
-- 	Region VARCHAR(32),
--     Sub_region VARCHAR(32),
--     Country_name INTEGER NOT NULL,
--     Time_Period INTEGER NOT NULL,
--     Pct_managed_drinking_water_services NUMERIC(5,2),
--     Pct_managed_sanitation_services NUMERIC(5,2),
--     Est_population_in_millions NUMERIC(11,6),
--     Est_gdp_in_billions NUMERIC(8,2),
--     Land_area NUMERIC(10,2),
--     pct_unemployment NUMERIC(5,2)

-- );

-- ALTER TABLE Access_to_basic_services
-- MODIFY COLUMN Country_name VARCHAR(37); used to modify the column datatype
-- ADD Gini_index FLOAT; Used to add the coumn name
-- DROP COLUMN Gini_index; used to drop a specific column

-- DROP TABLE Access_to_basic_services; used to drop the a specific table
-- DROP DATABASE united_nations; used to drop a database

-- insert data into the table
INSERT INTO Access_to_basic_services(
	 	Region,
        Sub_region,
        Country_name,
        Time_Period,
        Pct_managed_drinking_water_services,
        Pct_managed_sanitation_services,
        Est_population_in_millions,
        Est_gdp_in_billions,
        Land_area,
        pct_unemployment
)
VALUES(
	'Sub-Saharan','Southern Africa','South Africa',2020,92.0,78.67,58.801927,337.62,1213090.0,24.34
);

-- Region VARCHAR(32),
--     Sub_region VARCHAR(32),
--     Country_name INTEGER NOT NULL,
--     Time_Period INTEGER NOT NULL,
--     Pct_managed_drinking_water_services NUMERIC(5,2),
--     Pct_managed_sanitation_services NUMERIC(5,2),
--     Est_population_in_millions NUMERIC(11,6),
--     Est_gdp_in_billions NUMERIC(8,2),
--     Land_area NUMERIC(10,2),
--     pct_unemployment NUMERIC(5,2)
