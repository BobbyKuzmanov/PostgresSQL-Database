SELECT
    accounts.id || ' ' || accounts.username AS id_username,
    accounts.email
FROM
    accounts
JOIN
    accounts_photos ON accounts.id = accounts_photos.account_id
WHERE
    accounts.id = accounts_photos.photo_id
ORDER BY
    accounts.id ASC;

