CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id int)
AS
$$
BEGIN
    if (SELECT salary from employees WHERE employee_id = id IS NULL) THEN
        RETURN ;
    END IF;

    UPDATE employees
    SET salary = salary * 1.05
    WHERE employee_id = id;
    COMMIT;
end;
$$
    LANGUAGE plpgsql;