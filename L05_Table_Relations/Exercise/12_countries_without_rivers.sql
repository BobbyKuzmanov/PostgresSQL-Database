SELECT
	COUNT(*)
FROM
	countries
LEFT JOIN
	countries_rivers
-- ON
--     countries.country_code = countries_rivers.country_code
USING
	(country_code)
WHERE river_id IS NULL;