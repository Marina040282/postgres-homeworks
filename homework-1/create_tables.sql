
-- SQL-команда для создания Database: north

-- DROP DATABASE IF EXISTS north;

CREATE DATABASE north
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- SQL-команды для создания таблиц
CREATE TABLE employees
(
	employee_id SERIAL PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	title varchar(100) NOT NULL,
	birth_date date,
	notes text

);

CREATE TABLE customers
(
	customer_id varchar(10) REFERENCES customers(customer_id) NOT NULL PRIMARY KEY,
	company_name varchar(100),
	contact_name varchar(100)
);

CREATE TABLE orders
(
	orders_id int PRIMARY KEY,
	customer_id varchar(10) REFERENCES customers(customer_id) NOT NULL,
	employee_id int REFERENCES employees(employee_id) NOT NULL,
	order_date date,
	ship_city  varchar(100)
);