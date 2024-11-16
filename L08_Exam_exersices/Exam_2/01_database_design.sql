CREATE TABLE IF NOT EXISTS addresses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS categories(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS clients(
    "id" SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS drivers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INT NOT NULL ,
    rating NUMERIC(3, 2) DEFAULT 5.5,
    CONSTRAINT drivers_age_check CHECK (age > 0)
);

CREATE TABLE IF NOT EXISTS cars (
    "id" SERIAL PRIMARY KEY,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20) ,
    "year" INT DEFAULT 0 NOT NULL,
    "mileage" INT DEFAULT 0 ,
    "condition" CHAR(1) NOT NULL,
    category_id INT NOT NULL,

    CONSTRAINT cars_year_check CHECK (year > 0),
    CONSTRAINT cars_mileage_check CHECK (mileage > 0),
    CONSTRAINT fk_category_id_categories
        FOREIGN KEY(category_id)
            REFERENCES categories(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS courses(
    "id" SERIAL PRIMARY KEY,
    from_address_id INT NOT NULL,
    "start" TIMESTAMP NOT NULL,
    bill NUMERIC(10, 2)  DEFAULT 10,
    car_id INT NOT NULL,
    client_id INT NOT NULL,

    CONSTRAINT courses_bill_check CHECK (bill > 0),

    CONSTRAINT fk_courses_addresses
        FOREIGN KEY(from_address_id)
            REFERENCES addresses(id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
    CONSTRAINT fk_courses_cars
        FOREIGN KEY(car_id)
            REFERENCES cars(id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
    CONSTRAINT fk_courses_clients
        FOREIGN KEY(client_id)
            REFERENCES clients(id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS cars_drivers(
    driver_id INT NOT NULL,
    car_id INT NOT NULL,

    CONSTRAINT fk_driver_id_drivers
        FOREIGN KEY(driver_id)
            REFERENCES drivers("id")
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_car_id_cars
        FOREIGN KEY(car_id)
            REFERENCES cars("id")
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
