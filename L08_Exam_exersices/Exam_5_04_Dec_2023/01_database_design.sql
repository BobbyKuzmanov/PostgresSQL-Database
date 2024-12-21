CREATE TABLE IF NOT EXISTS countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,

    CONSTRAINT countries_unique_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(250) NULL,
    recipe TEXT NULL,
    price NUMERIC(10, 2) NOT NULL,

    CONSTRAINT check_price CHECK ( price > 0 )
);

CREATE TABLE IF NOT EXISTS customers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name CHAR(50) NOT NULL,
    gender CHAR(1)  NULL,
    age INT NOT NULL ,
    phone_number VARCHAR(10) NOT NULL,
    country_id INT NOT NULL,

    CONSTRAINT gender_check CHECK (gender IN ('M', 'F')),

    CONSTRAINT age_check CHECK ( age > 0 ),

    CONSTRAINT fk_customers_countries
        FOREIGN KEY(country_id)
            REFERENCES countries(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS feedbacks(
    id          SERIAL PRIMARY KEY,
    description VARCHAR(255)  NULL,
    rate        NUMERIC(4, 2) NULL,
    product_id  INT NOT NULL,
    customer_id INT NOT NULL,

    CONSTRAINT rate_check CHECK ( rate BETWEEN 0 AND 10 ),
    CONSTRAINT fk_feedbacks_products
        FOREIGN KEY (product_id)
            REFERENCES products (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_feedbacks_customers
        FOREIGN KEY (customer_id)
            REFERENCES customers (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS distributors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    address VARCHAR(30) NOT NULL,
    summary VARCHAR(200) NOT NULL,
    country_id INT NOT NULL,

    CONSTRAINT unique_name UNIQUE (name),

    CONSTRAINT fk_distributors_countries
        FOREIGN KEY(country_id)
            REFERENCES countries(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ingredients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200) NULL,
    country_id INT NOT NULL,
    distributor_id INT NOT NULL,

    CONSTRAINT fk_ingredients_countries
        FOREIGN KEY(country_id)
            REFERENCES countries(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_ingredients_distributors
        FOREIGN KEY(distributor_id)
            REFERENCES distributors(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS products_ingredients(
    product_id INT  NULL,
    ingredient_id INT  NULL,

    CONSTRAINT fk_products_ingredients_products
        FOREIGN KEY(product_id)
            REFERENCES products(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_products_ingredients_ingredients
        FOREIGN KEY(ingredient_id)
            REFERENCES ingredients(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
 