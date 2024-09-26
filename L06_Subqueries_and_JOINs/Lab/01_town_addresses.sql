SELECT
    t.town_id,
    t.name AS town_name,
    a.address_text
FROM
    addresses a
JOIN
    towns t
ON
    a.town_id = t.town_id
WHERE
    t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY
    t.town_id, a.address_id;