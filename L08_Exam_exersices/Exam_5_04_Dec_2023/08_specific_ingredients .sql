SELECT
    i.name AS ingredient_name,
    p.name AS product_name,
    d.name AS distributor_name
FROM
    ingredients i
JOIN
    products_ingredients pi ON i.id = pi.ingredient_id
JOIN
    products p ON pi.product_id = p.id
JOIN
    distributors d ON i.distributor_id = d.id
WHERE
    LOWER(i.name) LIKE '%mustard%'
    AND d.country_id = 16
ORDER BY
    product_name ASC;
