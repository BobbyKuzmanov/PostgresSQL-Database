CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30), address_town VARCHAR(30))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accounts
    SET job_title = CONCAT('(Remote) ', job_title)
    FROM addresses
    WHERE accounts.id = addresses.account_id
    AND addresses.street = udp_modify_account.address_street
    AND addresses.town = udp_modify_account.address_town;
END;
$$;

CALL udp_modify_account('97 Valley Edge Parkway', 'Nonexistent');
SELECT a.username, a.gender, a.job_title FROM accounts AS a
WHERE a.job_title ILIKE '(Remote)%';

CALL udp_modify_account('97 Valley Edge Parkway', 'Divinópolis');
SELECT a.username, a.gender, a.job_title FROM accounts AS a
WHERE a.job_title ILIKE '(Remote)%';