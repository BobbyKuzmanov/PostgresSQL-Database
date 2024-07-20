CREATE VIEW view_river_info AS

SELECT
    CONCAT('The river ', river_name, ' flows into the ', outflow,
           ' and is ', length, ' kilometers long.') AS "River Information"
FROM
    rivers
ORDER BY river_name;

-- Create a view named "view_river_info" that concatenates the "river_name",
-- "outflow" and "length" columns from the "rivers" table in the
-- following format:
-- 'The river', ' ', river_name, ' ', 'flows into the', ' ', outflow, ' ', 'and is', ' ', "length", ' ', 'kilometers long.'
-- The resulting column should be named "River Information", and the rows should
-- be ordered by the "river_name" field in ascending alphabetical order.