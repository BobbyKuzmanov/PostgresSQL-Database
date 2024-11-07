DELETE FROM volunteers
WHERE department_id = 2;

DELETE FROM volunteers_departments
WHERE id = 2
RETURNING *;
