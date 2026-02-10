-- Create a Basic_service Table
-- CREATE TABLE united_nations.Basic_services(
-- 	Country_name VARCHAR(37),
--     Time_period INTEGER,
--     Pct_managed_drinking_water_services NUMERIC(5,2),
--     Pct_managed_sanitation_services NUMERIC(5,2),
--     PRIMARY KEY (Country_name, Time_period),
--     FOREIGN KEY (Country_name) REFERENCES Geographical_Location (Country_name)
-- );

-- INSERT INTO Basic_services(Country_name, Time_period, Pct_managed_drinking_water_services, Pct_managed_sanitation_services)
-- SELECT
-- 	Country_name,
--     Time_period,
--     Pct_managed_drinking_water_services, 
--     Pct_managed_sanitation_services
-- FROM united_nations.Access_to_basic_services;

--  Create a Economic_indicators Table
-- CREATE TABLE united_nations.Economic_indicators(
-- 	Country_name VARCHAR(37),
--     Time_period INTEGER,
--     Est_population_in_millions NUMERIC(8,2),
--     Est_gdp_in_billions NUMERIC(11,2),
--     pct_unemployment NUMERIC(5,2),
--     PRIMARY KEY (Country_name, Time_period),
--     FOREIGN KEY (Country_name) REFERENCES Geographical_Location (Country_name)
-- );

INSERT INTO Economic_indicators(Country_name, Time_period, Est_population_in_millions,
    Est_gdp_in_billions,pct_unemployment)
SELECT
	Country_name,
    Time_period,
    Est_population_in_millions,
    Est_gdp_in_billions,
    pct_unemployment
FROM united_nations.Access_to_basic_services;












