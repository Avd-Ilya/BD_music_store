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
    type VARCHAR(30) NOT NULL,
    extra_line INT
);

CREATE TABLE publisher (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    product VARCHAR(60) NOT NULL,
    extra_line VARCHAR(30)
);

CREATE TABLE provider (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adres VARCHAR(30) NOT NULL,
    phone_number INT NOT NULL,
    name VARCHAR(60) NOT NULL,
    extra_line INT
);

CREATE TABLE storage (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    phone_number INT not null,
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

ALTER TABLE developer
MODIFY COLUMN extra_line CHAR(100) NULL;

ALTER TABLE developer
DROP COLUMN extra_line;

ALTER TABLE publisher
MODIFY COLUMN extra_line int NULL;

ALTER TABLE publisher
DROP COLUMN extra_line;

ALTER TABLE provider
MODIFY COLUMN extra_line CHAR(100) NULL;

ALTER TABLE provider
DROP COLUMN extra_line;

ALTER TABLE storage
ADD extra_line INT NOT NULL;

ALTER TABLE storage
MODIFY COLUMN extra_line CHAR(100) NULL;

ALTER TABLE storage
DROP COLUMN extra_line;

ALTER TABLE seller
ADD extra_line INT NOT NULL;

ALTER TABLE seller
DROP COLUMN extra_line;

INSERT genre(id, name) 
VALUES (1, 'rpg');

INSERT genre(name) 
VALUES ('strategy');

INSERT platform(id, name) 
VALUES (1, 'nintendo switch');

INSERT developer(id, name, number_of_employees, products, type) 
VALUES (1, 'Limbic Entertainment', 80, 'games', 'private');

INSERT publisher(id, name, product) 
VALUES (1, 'Kalypso Media', 'video games');

INSERT provider(id, adres, phone_number, name) 
VALUES (1, 'Russia, Volgograd, Kukuevo, 1', 88444210, 'Kukuevo');

INSERT storage(id, name, phone_number, content, adres) 
VALUES (1, 'Kolotushka', 55555, 10000, 'Volgograd, Kolotushkina, 1');

INSERT delivery(id, date_, num_of_games_delivered, provider_id, storage_id) 
VALUES (1, '2021-03-11', 50, 1, 1);

INSERT games(id, edition, price, name, publisher_id, dev_id) 
VALUES (1, 'standart', 750, 'disco elysium', 1, 1);

INSERT connect_prov_pub(prov_id, pub_id)
VALUES (1, 1);

INSERT publisher(name, product) 
VALUES ('ZA/UM', 'video games');

INSERT connect_prov_pub(prov_id, pub_id)
VALUES (1, 2);

rename table order_ to orderr;

rename table connect_prov_pub to connect_prov_publisher;

#mod n1
drop table connect_genre_game;

alter table games
add genre_id INT NOT NULL;

UPDATE games SET `genre_id` = '1' WHERE (`id` = '1');

alter table games
ADD FOREIGN KEY(genre_id) REFERENCES genre(id)  ON UPDATE CASCADE ON DELETE CASCADE;

#mod n2
ALTER TABLE copy
DROP FOREIGN KEY copy_ibfk_4;

ALTER TABLE copy
DROP COLUMN platform_id;

CREATE TABLE connect_copy_platform (
    copy_key VARCHAR(60) NOT NULL,
    platform_id INT NOT NULL,
    PRIMARY KEY (copy_key , platform_id),
    FOREIGN KEY (copy_key)
        REFERENCES copy (key_),
    FOREIGN KEY (platform_id)
        REFERENCES platform (id)
);

#mod n3
ALTER TABLE orderr
MODIFY date_ DATETIME DEFAULT NOW();




