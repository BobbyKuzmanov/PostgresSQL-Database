CREATE OR REPLACE FUNCTION fn_creator_with_board_games(creator_first_name VARCHAR(30))
RETURNS INTEGER AS $$
DECLARE
    total_games INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO total_games
    FROM creators
    JOIN creators_board_games ON creators.id = creators_board_games.creator_id
    WHERE creators.first_name = creator_first_name;

    RETURN total_games;
END; $$ LANGUAGE plpgsql;


-- testing
SELECT fn_creator_with_board_games('Bruno');
SELECT fn_creator_with_board_games('Alexander')