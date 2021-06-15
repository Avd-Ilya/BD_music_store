CREATE DATABASE Avilov;

USE Avilov;

CREATE TABLE genre (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE developer (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    number_of_employees INT NOT NULL,
    products VARCHAR(30) NOT NULL,
    type VARCHAR(30) NOT NULL
);

CREATE TABLE publisher (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    product VARCHAR(60) NOT NULL
);

CREATE TABLE provider (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adres VARCHAR(30) NOT NULL,
    phone_number INT NOT NULL,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE storage (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    phone_number INT,
    content INT NOT NULL,
    adres VARCHAR(30) NOT NULL
);

CREATE TABLE seller (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fio VARCHAR(60) NOT NULL,
    phone_number INT NOT NULL
);

CREATE TABLE account (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fio VARCHAR(60) NOT NULL,
    phone_number INT NOT NULL,
    city VARCHAR(30) NOT NULL,
    payment_card INT NOT NULL
);

CREATE TABLE platform (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE order_ (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_ DATE NOT NULL,
    is_pald BOOL NOT NULL,
    seller_id INT NOT NULL,
    acc_id INT NOT NULL,
    FOREIGN KEY (seller_id)
        REFERENCES seller (id),
    FOREIGN KEY (acc_id)
        REFERENCES account (id)
);

CREATE TABLE delivery (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_ DATE NOT NULL,
    num_of_games_delivered INT NOT NULL,
    provider_id INT NOT NULL,
    storage_id INT NOT NULL,
    FOREIGN KEY (provider_id)
        REFERENCES provider (id),
    FOREIGN KEY (storage_id)
        REFERENCES storage (id)
);

CREATE TABLE games (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    edition VARCHAR(60) NOT NULL,
    price FLOAT NOT NULL,
    name VARCHAR(60) NOT NULL,
    publisher_id INT NOT NULL,
    dev_id INT NOT NULL,
    FOREIGN KEY (publisher_id)
        REFERENCES publisher (id),
    FOREIGN KEY (dev_id)
        REFERENCES developer (id)
);

CREATE TABLE copy (
    key_ VARCHAR(60) NOT NULL PRIMARY KEY,
    is_physical_copy BOOL NOT NULL,
    game_id INT NOT NULL,
    delivery_id INT NOT NULL,
    order_id INT NOT NULL,
    platform_id INT NOT NULL,
    FOREIGN KEY (game_id)
        REFERENCES games (id),
    FOREIGN KEY (delivery_id)
        REFERENCES delivery (id),
    FOREIGN KEY (order_id)
        REFERENCES order_ (id),
    FOREIGN KEY (platform_id)
        REFERENCES platform (id)
);

CREATE TABLE connect_genre_game (
    game_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (game_id , genre_id),
    FOREIGN KEY (game_id)
        REFERENCES games (id),
    FOREIGN KEY (genre_id)
        REFERENCES genre (id)
);

CREATE TABLE connect_prov_pub (
    prov_id INT NOT NULL,
    pub_id INT NOT NULL,
    PRIMARY KEY (prov_id , pub_id),
    FOREIGN KEY (prov_id)
        REFERENCES provider (id),
    FOREIGN KEY (pub_id)
        REFERENCES publisher (id)
);




























