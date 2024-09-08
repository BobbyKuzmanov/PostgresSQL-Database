 SELECT
    departments.*,
    employees.*
FROM
    departments
JOIN
    employees ON departments.id = employees.department_id;