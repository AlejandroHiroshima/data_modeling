CREATE SCHEMA IF NOT EXISTS ezecream_05;

SET search_path TO ezecream_05; -- gör så att tables läggs automatiskt in i schema ezecream_05

CREATE TABLE IF NOT EXISTS Customer (
    customer_id SERIAL PRIMARY KEY, -- SERIAL gör en sequence
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    personal_number CHAR(12),
    email VARCHAR(255) NOT NULL,
    address VARCHAR(100) NOT NULL   
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);


-- TODO fyll i resten av de fysiska diagrammen