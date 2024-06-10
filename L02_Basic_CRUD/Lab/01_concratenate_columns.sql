SELECT
    id,
    concat(e.first_name, ' ', e.last_name) AS "Full Name",
    job_title AS "Job Title"
FROM employees AS e

