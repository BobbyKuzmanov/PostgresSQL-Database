CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(product_name VARCHAR(25))
RETURNS TABLE (
    customer_id INT,
    customer_name VARCHAR(75),
    feedback_description VARCHAR(255),
    feedback_rate NUMERIC(4, 2)
) AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT
        c.id AS customer_id,
        (c.first_name)::VARCHAR(75) AS customer_name,
        f.description AS feedback_description,
        f.rate AS feedback_rate
    FROM
        feedbacks f
    JOIN
        customers c ON f.customer_id = c.id
    JOIN
        products p ON f.product_id = p.id
    WHERE
        p.name = product_name
    ORDER BY
        c.id;
END;
$$ LANGUAGE plpgsql;

--testing
SELECT * FROM fn_feedbacks_for_product('Banitsa');
SELECT * FROM fn_feedbacks_for_product('ALCOHOL');
SELECT * FROM fn_feedbacks_for_product('Bread');