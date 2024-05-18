CREATE TABLE employees(
    id serial NOT NULL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hiring date default '2023-01-01',
    salary numeric(10,2),
    device_number int
);

CREATE TABLE departments(
    id serial NOT NULL PRIMARY KEY,
    name varchar(50),
    code char(3),
    description text
);

CREATE TABLE  issues(
    id serial primary key  unique,
    description varchar(150),
    date date,
    start timestamp
);
