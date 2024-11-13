SELECT a.name AS animal,
       EXTRACT(YEAR FROM a.birthdate) AS year_of_birth,
       at.animal_type
FROM animals AS  a
JOIN animal_types at ON a.animal_type_id = at.id
WHERE a.owner_id IS NULL
    AND
        a.animal_type_id != 3
    AND
	    EXTRACT(YEAR FROM AGE('01/01/2022', a.birthdate)) < 5
ORDER BY
    animal;

