CREATE OR REPLACE PROCEDURE sp_players_team_name(
    player_name VARCHAR(50), OUT team_name VARCHAR(45)
)
LANGUAGE plpgsql
AS $$
DECLARE
    player_first_name VARCHAR(10);
    player_last_name VARCHAR(20);
BEGIN
    player_first_name := split_part(player_name, ' ', 1);
    player_last_name := split_part(player_name, ' ', 2);

    SELECT t.name
    INTO team_name
    FROM players p
    JOIN teams t ON p.team_id = t.id
    WHERE p.first_name = player_first_name
      AND p.last_name = player_last_name;

    IF team_name IS NULL THEN
        team_name := 'The player currently has no team';
    END IF;
END;
$$;

--testing
CALL sp_players_team_name('Thor Serrels', '');
CALL sp_players_team_name('Walther Olenchenko', '');
CALL sp_players_team_name('Isaak Duncombe', '')

