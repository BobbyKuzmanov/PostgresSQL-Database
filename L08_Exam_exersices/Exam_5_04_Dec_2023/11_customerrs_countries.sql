CREATE OR REPLACE PROCEDURE sp_customer_country_name(
    IN customer_full_name VARCHAR(50),
    OUT country_name VARCHAR(50)
)
LANGUAGE plpgsql AS $$
DECLARE
    cust_first_name VARCHAR(25);
    cust_last_name VARCHAR(50);
BEGIN
    -- Split the full name into first name and last name
    cust_first_name := split_part(customer_full_name, ' ', 1);
    cust_last_name := split_part(customer_full_name, ' ', 2);

    -- Retrieve the country name based on the first and last name
    SELECT
        co.name
    INTO
        country_name
    FROM
        customers c
    JOIN
        countries co ON c.country_id = co.id
    WHERE
        c.first_name = cust_first_name AND
        c.last_name = cust_last_name;
END;
$$;

--testing
CALL sp_customer_country_name('Betty Wallace', '');
CALL sp_customer_country_name('Rachel Bishop', '');