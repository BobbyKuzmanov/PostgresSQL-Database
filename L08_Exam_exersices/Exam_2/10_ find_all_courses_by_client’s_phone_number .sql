CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INTEGER AS $$
DECLARE
    course_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO course_count
    FROM courses co
    JOIN clients c ON co.client_id = c.id
    WHERE c.phone_number = phone_num;

    RETURN course_count;
END;
$$ LANGUAGE plpgsql;


SELECT fn_courses_by_client('(803) 6386812'); -- Expected output: 5
SELECT fn_courses_by_client('(831) 1391236'); -- Expected output: 3
SELECT fn_courses_by_client('(704) 2502909'); -- Expected output: 0
