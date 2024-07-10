CREATE VIEW view_initials AS
SELECT
    SUBSTRING(first_name FROM 1 FOR 2) AS initial,
    last_name
FROM employees
ORDER BY last_name;

SELECT * FROM view_initials;
