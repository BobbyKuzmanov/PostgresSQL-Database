SELECT
    first_name,
    last_name,
    extract('year' from born)
FROM authors;