BEGIN;

UPDATE employees
SET salary = salary + 1500
WHERE hire_date BETWEEN '1998-01-01' AND '2000-01-05';

UPDATE employees
SET job_title = 'Senior ' || job_title
WHERE hire_date BETWEEN '1998-01-01' AND '2000-01-05';

COMMIT;


SELECT *
FROM employees
WHERE hire_date BETWEEN '1998-01-01' AND '2000-01-05';
