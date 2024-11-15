CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INTEGER AS $$
DECLARE
    volunteer_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO volunteer_count
    FROM volunteers v
    JOIN volunteers_departments vd ON v.department_id = vd.id
    WHERE vd.department_name = searched_volunteers_department;

    RETURN volunteer_count;
END;
$$ LANGUAGE plpgsql;


SELECT fn_get_volunteers_count_from_department('Education program assistant')
