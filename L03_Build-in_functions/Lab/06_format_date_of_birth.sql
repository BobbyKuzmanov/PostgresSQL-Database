SELECT
    last_name,
    to_char(born, 'DD (Dy) Mon YYYY') AS "Date of Birth"
FROM authors