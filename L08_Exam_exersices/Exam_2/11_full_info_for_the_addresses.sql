CREATE TABLE IF NOT EXISTS search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
    TRUNCATE TABLE search_results;

    INSERT INTO search_results (address_name, full_name, level_of_bill, make, condition, category_name)
    SELECT
        a.name AS address_name,
        c.full_name,
        CASE
            WHEN co.bill <= 20 THEN 'Low'
            WHEN co.bill <= 30 THEN 'Medium'
            ELSE 'High'
        END AS level_of_bill,
        ca.make,
        ca.condition,
        cat.name AS category_name
    FROM
        courses co
    JOIN
        addresses a ON co.from_address_id = a.id
    JOIN
        clients c ON co.client_id = c.id
    JOIN
        cars ca ON co.car_id = ca.id
    JOIN
        categories cat ON ca.category_id = cat.id
    WHERE
        a.name = address_name
    ORDER BY
        ca.make, c.full_name;
END;
$$;

-- testing
CALL sp_courses_by_address('700 Monterey Avenue');

SELECT * FROM search_results;