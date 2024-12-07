SELECT
    cr.last_name,
    CEIL(AVG(bg.rating)) AS average_rating,
    p.name AS publisher_name
FROM
    creators cr
JOIN
    creators_board_games cbg ON cr.id = cbg.creator_id
JOIN
    board_games bg ON cbg.board_game_id = bg.id
JOIN
    publishers p ON bg.publisher_id = p.id
WHERE
    p.name = 'Stonemaier Games'
GROUP BY
    cr.last_name, p.name
ORDER BY
    average_rating DESC;
