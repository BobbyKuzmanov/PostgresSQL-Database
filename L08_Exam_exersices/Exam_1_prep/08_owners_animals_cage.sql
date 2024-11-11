SELECT CONCAT(o.name, ' - ', a.name) AS owner_animal,
       o.phone_number,
       c.id AS cage_id
FROM owners AS o
JOIN animals AS a ON o.id = a.owner_id

JOIN animal_types AS at ON a.animal_type_id = at.id

JOIN animals_cages AS ac ON a.id = ac.animal_id

JOIN cages AS c ON ac.cage_id = c.id

WHERE at.animal_type = 'Mammals'
ORDER BY o.name ASC, a.name DESC;
