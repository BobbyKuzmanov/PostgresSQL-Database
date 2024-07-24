SELECT regexp_replace("River Information", '[^0-9]', '', 'g') AS river_lenght
FROM view_river_info;
