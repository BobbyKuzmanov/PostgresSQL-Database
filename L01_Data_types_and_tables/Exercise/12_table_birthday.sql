CREATE TABLE minions_birthdays (
    id serial NOT NULL UNIQUE PRIMARY KEY,
    name varchar(30),
    date_of_birth date,
    age int,
    present VARCHAR(100),
    party TIMESTAMP WITH TIME ZONE
);
