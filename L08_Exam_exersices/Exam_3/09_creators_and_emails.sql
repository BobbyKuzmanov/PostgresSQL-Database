SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.email,
    MAX(bg.rating) AS rating
FROM
    creators c
JOIN
    creators_board_games cbg ON c.id = cbg.creator_id
JOIN
    board_games bg ON cbg.board_game_id = bg.id
WHERE
    c.email LIKE '%.com'
GROUP BY
    c.id
ORDER BY
    full_name ASC;
