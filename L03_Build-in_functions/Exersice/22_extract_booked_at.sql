SELECT extract('year' from booked_at)         AS YEAR,
       extract('month' from booked_at)        AS MONTH,
       extract('day' from booked_at)          AS DAY,
       extract('hour' from booked_at)         AS HOUR,
       extract('minute' from booked_at)       AS MINUTE,
       ceil(extract('second' from booked_at)) AS SECOND
FROM bookings