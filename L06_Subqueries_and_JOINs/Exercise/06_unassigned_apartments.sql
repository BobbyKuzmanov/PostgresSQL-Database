SELECT
    B.booking_id,
    b.apartment_id,
    c.companion_full_name
FROM
    bookings AS b
JOIN
    customers AS c
ON
    c.customer_id = b.customer_id AND B.apartment_id IS NULL;
