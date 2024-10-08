SELECT
    a.name,
    SUM(b.booked_for)
FROM
    apartments AS a
JOIN
    bookings AS b
ON
    b.apartment_id = a.apartment_id
GROUP BY
    a.name
ORDER BY
    a.name ASC;
