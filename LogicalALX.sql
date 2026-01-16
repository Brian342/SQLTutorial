SELECT 
	Country_name,
	Time_period,
	Pct_managed_drinking_water_services,
	Pct_managed_sanitation_services,
	Est_population_in_millions,
	Est_gdp_in_billions
FROM
	united_nations.Access_to_basic_services
where 
	Country_name = 'Nigeria'
    or Country_name = 'Ethiopia'
    or Country_name = 'Congo'
    or Country_name = 'Egypt'
    or Country_name = 'Tanzania'
    or Country_name = 'Kenya'
    or Country_name = 'South Africa'
    AND Time_Period BETWEEN 2019 AND 2020;

