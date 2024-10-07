SELECT
   COUNT( b.booked_for)
FROM
    bookings AS b
JOIN
    customers AS c
ON
    b.customer_id = c.customer_id
WHERE
    c.last_name = 'Hahn';