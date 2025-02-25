SELECT DISTINCT d.name AS distributor_name,
                i.name AS ingredient_name,
                p.name AS product_name,
                AVG(f.rate) AS average_rate
FROM distributors d
JOIN ingredients i ON d.id = i.distributor_id
JOIN products_ingredients pi ON i.id = pi.ingredient_id
JOIN products p ON pi.product_id = p.id
JOIN feedbacks f ON p.id = f.product_id
GROUP BY d.name, i.name, p.name
HAVING AVG(f.rate) BETWEEN 5 AND 8
ORDER BY distributor_name ASC, ingredient_name ASC, product_name ASC;
