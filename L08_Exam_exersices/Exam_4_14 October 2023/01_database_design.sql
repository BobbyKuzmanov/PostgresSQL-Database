CREATE TABLE IF NOT EXISTS towns(
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS coaches(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 NOT NULL,
    coach_level INT DEFAULT 0 NOT NULL,

    CONSTRAINT salary_check CHECK (salary >= 0),
    CONSTRAINT coach_level_check CHECK (coach_level >= 0)
);

CREATE TABLE IF NOT EXISTS skills_data(
    id SERIAL PRIMARY KEY,
    dribbling INT DEFAULT 0 NULL,
    pace INT DEFAULT 0 NULL,
    passing INT DEFAULT 0 NULL,
    shooting INT DEFAULT 0 NULL,
    speed INT DEFAULT 0 NULL,
    strength INT DEFAULT 0 NULL,

    CONSTRAINT speed_check CHECK (speed >= 0),
    CONSTRAINT strength_check CHECK (strength >= 0),
    CONSTRAINT shooting_check CHECK (shooting >= 0),
    CONSTRAINT passing_check CHECK (passing >= 0),
    CONSTRAINT pace_check CHECK (pace >= 0),
    CONSTRAINT dribbling_check CHECK (dribbling >= 0)
);

CREATE TABLE IF NOT EXISTS stadiums(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    town_id INT NOT NULL,

    CONSTRAINT stadiums_capacity_check CHECK (capacity > 0),

    CONSTRAINT fk_stadiums_towns
        FOREIGN KEY (town_id)
            REFERENCES towns (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS teams(
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base INT DEFAULT 0 NOT NULL,
    stadium_id INT NOT NULL,

    CONSTRAINT fan_base_check CHECK ( fan_base >= 0 ),
    CONSTRAINT fk_teams_stadiums
        FOREIGN KEY (stadium_id)
            REFERENCES stadiums (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS players(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT DEFAULT 0  NOT NULL,
    position CHAR(1) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 NOT NULL,
    hire_date TIMESTAMP NULL ,
    skills_data_id INT NOT NULL,
    team_id INT,

    CONSTRAINT age_check CHECK ( age >= 0 ),
    CONSTRAINT salary_check CHECK ( salary >= 0 ),

    CONSTRAINT fk_players_skills_data
        FOREIGN KEY (skills_data_id)
            REFERENCES skills_data (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_players_teams
        FOREIGN KEY (team_id)
            REFERENCES teams (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS players_coaches(
    player_id INT NOT NULL,
    coach_id INT NOT NULL,

    CONSTRAINT pk_players_coaches PRIMARY KEY(player_id, coach_id),

    CONSTRAINT fk_players_coaches_players
        FOREIGN KEY(player_id)
            REFERENCES players(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_players_coaches_coaches
        FOREIGN KEY(coach_id)
            REFERENCES coaches(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


