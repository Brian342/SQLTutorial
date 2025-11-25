CREATE TABLE
	country_list(Country VARCHAR(255));
    
INSERT INTO
	Country_list(Country)
SELECT DISTINCT
	Country_name
FROM
	united_nations.Access_to_basic_services;