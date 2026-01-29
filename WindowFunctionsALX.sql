SELECT
	Sub_region,
    Country_name,
    Land_area,
	SUM(Land_Area) OVER (PARTITION BY Sub_region) AS Pct_sub_region_land_area
FROM
	united_nations.Access_to_basic_services
WHERE
	Time_Period = 2020
AND Land_area IS NOT NULL;