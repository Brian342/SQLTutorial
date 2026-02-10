use united_nations;
SELECT
	Country_name,
    Time_period,
    ROUND(Est_gdp_in_billions) AS Rounded_Est_gdp_in_billions,
    log(Est_gdp_in_billions) AS Log_Est_gdp_in_billions
FROM
	Access_to_basic_services