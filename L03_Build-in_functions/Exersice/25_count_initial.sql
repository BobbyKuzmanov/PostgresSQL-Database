SELECT
    LEFT(first_name, 2) AS initial,
    COUNT('initial') as user_count
FROM
    users
GROUP BY
    initial
ORDER BY
    user_count DESC,
    initial;