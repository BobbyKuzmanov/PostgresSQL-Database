SELECT e.employee_id,
       concat(e.first_name, ' ', last_name) AS full_name,
       p.project_id,
       p.name AS project_name
FROM
    employees AS e
JOIN
    employees_projects AS e_p
ON
    e.employee_id = e_p.employee_id
JOIN
    projects AS p
ON
    p.project_id = e_p.project_id
WHERE
    e_p.project_id = 1;
