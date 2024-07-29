SELECT
    TRIM('M' FROM peak_name) AS left_trim,
    TRIM('m' FROM peak_name) AS right_trim
FROM peaks