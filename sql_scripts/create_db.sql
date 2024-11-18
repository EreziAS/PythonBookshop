-- Création du schéma "bookshop" si il n'existe pas
CREATE SCHEMA IF NOT EXISTS bookshop;

-- Sélectionner le schéma "bookshop" pour créer les tables dedans
SET search_path TO bookshop;

-- Suppression des tables existantes si elles existent déjà
DROP TABLE IF EXISTS bookshop.caddy_items CASCADE;
DROP TABLE IF EXISTS bookshop.caddies CASCADE;
DROP TABLE IF EXISTS bookshop.clients CASCADE;
DROP TABLE IF EXISTS bookshop.employees CASCADE;
DROP TABLE IF EXISTS bookshop.books CASCADE;
DROP TABLE IF EXISTS bookshop.subjects CASCADE;
DROP TABLE IF EXISTS bookshop.authors CASCADE;

-- Création de la table "authors"
CREATE TABLE bookshop.authors (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    birth_date DATE
);

-- Création de la table "subjects"
CREATE TABLE bookshop.subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Création de la table "books"
CREATE TABLE bookshop.books (
    id SERIAL PRIMARY KEY,
    author_id INT,
    subject_id INT,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    page_count INT,
    stock_quantity INT,
    price DECIMAL(10, 2),
    publish_year INT,
    FOREIGN KEY (author_id) REFERENCES bookshop.authors(id),
    FOREIGN KEY (subject_id) REFERENCES bookshop.subjects(id)
);

-- Création de la table "employees"
CREATE TABLE bookshop.employees (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Création de la table "clients"
CREATE TABLE bookshop.clients (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    client_number VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(255)
);

-- Création de la table "caddies"
CREATE TABLE bookshop.caddies (
    id SERIAL PRIMARY KEY,
    client_id INT,
    date DATE NOT NULL,
    amount DECIMAL(10, 2),
    payed BOOLEAN,
    FOREIGN KEY (client_id) REFERENCES bookshop.clients(id)
);

-- Création de la table "caddy_items"
CREATE TABLE bookshop.caddy_items (
    id SERIAL PRIMARY KEY,
    caddy_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (caddy_id) REFERENCES bookshop.caddies(id),
    FOREIGN KEY (book_id) REFERENCES bookshop.books(id)
);

-- Insertion de données dans la table "authors"
INSERT INTO bookshop.authors (last_name, first_name, birth_date) VALUES
('Dicker', 'Joel', '1985-06-16'),
('King', 'Stephen', '1947-09-21');

-- Insertion de données dans la table "subjects"
INSERT INTO bookshop.subjects (name) VALUES
('Crime'),
('Novel'),
('Thriller'),
('Horror');

-- Insertion de données dans la table "books"
INSERT INTO bookshop.books (author_id, subject_id, title, isbn, page_count, stock_quantity, price, publish_year) VALUES
(1, 1, 'La Vérité sur l''affaire Harry Quebert', '978-2877068161', 670, 5, 12.99, 2012),
(1, 2, 'La Disparition de Stephanie Mailer', '979-1032102008', 640, 2, 9.99, 2018),
(1, 3, 'Un Animal Sauvage', '978-2889730483', 305, 12, 22.99, 2024),
(2, 4, 'IT', '978-2226034533', 627, 12, 15.99, 1988);

-- Insertion de données dans la table "employees"
INSERT INTO bookshop.employees (login, password) VALUES
('admin', 'password123'),
('user1', 'mypassword');

-- Insertion de données dans la table "clients"
INSERT INTO bookshop.clients (last_name, first_name, client_number, address) VALUES
('Dupont', 'Marie', 'CLT001', '123 Rue de Paris, Paris'),
('Lemoine', 'Pierre', 'CLT002', '45 Avenue de la République, Lyon');
