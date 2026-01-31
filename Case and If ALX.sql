SELECT
	CASE
		WHEN Country_name IN ('Angola', 'Botswana', 'Comoros','DRC', 'Eswatini','Lesotho'
        'Madagascar','Malawi', 'Mauritius', 'Mozambique', 'Namibia', 'Seychelles', 'South Africa', 'Tanzania'
        'Zambia', 'Zimbabwe')
        THEN 'SADC'
        
        WHEN Country_name IN ("Algeria","Libya", "Mauritania", "Morocco", "Tunisia")
			THEN "UMA"
            
		ELSE 'Not Classified'
	END AS Regional_economy_community,
    MIN(Pct_managed_drinking_water_services) AS min_Pct_managed_drinking_water_services,
    AVG(Pct_managed_drinking_water_services) AS avg_Pct_managed_drinking_water_services,
    MAX(Pct_managed_drinking_water_services) AS max_Pct_managed_drinking_water_services
    
FROM united_nations.Access_to_basic_services
WHERE Region LIKE '%Africa%'
GROUP BY
	CASE
		WHEN Country_name IN ('Angola', 'Botswana', 'Comoros','DRC', 'Eswatini','Lesotho'
        'Madagascar','Malawi', 'Mauritius', 'Mozambique', 'Namibia', 'Seychelles', 'South Africa', 'Tanzania'
        'Zambia', 'Zimbabwe')
        THEN 'SADC'
        
        WHEN Country_name IN ("Algeria","Libya", "Mauritania", "Morocco", "Tunisia")
			THEN "UMA"
            
		ELSE 'Not Classified'
	END;