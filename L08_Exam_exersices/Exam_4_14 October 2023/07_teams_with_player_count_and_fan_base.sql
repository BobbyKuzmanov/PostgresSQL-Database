SELECT
    t.id AS team_id, t.name AS team_name, COUNT(p.id) AS player_count, t.fan_base
FROM
    teams t
LEFT JOIN
        players p ON t.id = p.team_id
GROUP BY
    t.id
HAVING
    t.fan_base > 30000
ORDER BY
    player_count DESC,
    fan_base DESC;
