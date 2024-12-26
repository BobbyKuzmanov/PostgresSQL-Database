SELECT
    f.product_id,
    f.rate,
    f.description,
    c.id AS customer_id,
    c.age,
    c.gender
FROM
    feedbacks f
JOIN
    customers c
ON
    f.customer_id = c.id
WHERE
    f.rate < 5.0
AND
    c.gender = 'F'
AND
    c.age > 30
ORDER BY
    f.product_id DESC;
