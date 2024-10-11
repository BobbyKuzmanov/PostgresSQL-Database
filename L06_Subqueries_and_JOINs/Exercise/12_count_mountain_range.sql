SELECT
    mc.country_code,
    COUNT(mountain_range) AS mountain_range
FROM
    mountains_countries AS mc
JOIN
    mountains AS m
ON
    mc.mountain_id = m.id
WHERE
    mc.country_code IN ('BG', 'RU', 'US')
GROUP BY
    mc.country_code
ORDER BY
    mountain_range DESC
