CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT AS $$
DECLARE
    photos_count INT;
BEGIN
    SELECT COUNT(ap.photo_id)
    INTO photos_count
    FROM accounts a
    JOIN accounts_photos ap ON a.id = ap.account_id
    WHERE a.username = account_username;

    RETURN photos_count;
END;
$$ LANGUAGE plpgsql;


SELECT udf_accounts_photos_count('ssantryd') AS photos_count;