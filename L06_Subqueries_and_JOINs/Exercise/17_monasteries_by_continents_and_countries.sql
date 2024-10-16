UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar';

-- Inserting 'Hanga Abbey' in 'Tanzania'
INSERT INTO monasteries (name, country_code)
VALUES ('Hanga Abbey', 'Tanzania');

-- Inserting 'Myin-Tin-Daik' in 'Myanmar'
INSERT INTO monasteries (name, country_code)
VALUES ('Myin-Tin-Daik', 'Myanmar');

SELECT
    c.country_name,
    ct.continent_name,
    COUNT(m.monastery_name) AS monastery_count
FROM
    monasteries m
JOIN
    countries c ON m.country_code = c.country_code
JOIN
    continents ct ON c.continent_code = ct.continent_code
GROUP BY
    c.country_name, ct.continent_name
ORDER BY
    monastery_count DESC,
    c.country_name ASC;






-- Create a SQL query that updates the "countries" table by replacing
-- 'Myanmar' with 'Burma'. Additionally, add a new row to the "monasteries" table
-- with 'Hanga Abbey' as the name and 'Tanzania' as the country code.
-- Another row should also be inserted into the "monasteries" table with 'Myin-Tin-Daik'
-- as the name and 'Myanmar' as the country code.
-- To retrieve the number of monasteries in each country along with their
-- corresponding "continent_name", construct a query that joins the "continents",
-- "countries", and "monasteries" tables. Choose exclusively those countries without
-- the "three_rivers" column.  Group the results by "country_name" and "continent_name",
-- and sort them by the number of monasteries in descending order. In the case of a tie,
-- sort the results by country name in ascending order.