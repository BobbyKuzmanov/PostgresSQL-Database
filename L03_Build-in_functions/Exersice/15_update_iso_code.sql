UPDATE countries
SET iso_code = UPPER(SUBSTRING(country_name FROM 1 FOR 3))
WHERE iso_code IS NULL;
