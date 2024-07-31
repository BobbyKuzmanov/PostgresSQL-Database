SELECT population
AS population,
       LENGTH(CAST(population AS TEXT)) AS length
FROM countries;