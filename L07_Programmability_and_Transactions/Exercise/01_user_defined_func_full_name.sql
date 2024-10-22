-- user defined function that returns full name and capitalize it
-- first letter of each name

CREATE OR REPLACE FUNCTION fn_full_name(first_name TEXT, last_name TEXT)
RETURNS TEXT AS $$
BEGIN
    IF first_name IS NULL AND last_name IS NULL THEN
        RETURN NULL;
    ELSIF first_name IS NULL THEN
        RETURN INITCAP(last_name);
    ELSIF last_name IS NULL THEN
        RETURN INITCAP(first_name);
    ELSE
        RETURN INITCAP(first_name) || ' ' || INITCAP(last_name);
    END IF;
END;
$$ LANGUAGE plpgsql;


-- testing
SELECT fn_full_name('john', 'doe');
