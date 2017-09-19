CREATE DATABASE galvanize_contracts;

CREATE USER galvanize_admin PASSWORD 'galvanize_P@$$w0rd';

REVOKE ALL PRIVILEGES ON DATABASE galvanize_contracts FROM PUBLIC;

GRANT USAGE ON SCHEMA public TO PUBLIC;

ALTER USER galvanize_admin WITH SUPERUSER;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO galvanize_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO galvanize_admin;

pg_dumpall -r > database_roles.sql;

CREATE TABLE "User"(id SERIAL PRIMARY KEY, first_name VARCHAR, last_name VARCHAR, date_of_birth DATE, biography VARCHAR);

INSERT INTO "User"(first_name, last_name, date_of_birth, biography) VALUES ('Kyle', 'Coberly', '1961-02-18', 'Web app developer, business dork, amateur economist.'), ('CJ', 'Reynolds', '2031-04-28', 'Does the man have the moustache, or does the moustache have the man?'), ('Danny', 'Fritz', '1805/09/15', 'Definitely a human instructor, not a robot.'), ('Roberto', 'Ortega', '2015/10/17', 'Llamas age faster than people.');

CREATE TABLE "Contact"(id SERIAL PRIMARY KEY, type VARCHAR NOT NULL, value VARCHAR NOT NULL, user_id INTEGER);

INSERT INTO "Contact"(type, value, user_id) VALUES ('email', 'kyle.coberly@galvanize.com', 1), ('phone', 911, 1), ('email', 'cj.reynolds@galvanize.com', 2), ('email', 'danny.fritz@galvanize.com', 3), ('phone', 0, 3), ('email', 'roberto.ortega@galvanize.com', 4);

pg_dump galvanize_contracts > database_dump.sql;

SELECT first_name, last_name FROM "User" WHERE date_of_birth >= '2000-01-01' ORDER BY first_name DESC;

SELECT biography FROM "User" WHERE biography LIKE '%man%';

SELECT first_name, last_name, type, value FROM "User" u INNER JOIN "Contact" c ON u.id = c.user_id WHERE u.first_name = 'Danny';

SELECT first_name FROM "User" WHERE first_name = 'Danny' OR first_name = 'Kyle';

SELECT first_name, COUNT(type) FROM "User" u INNER JOIN "Contact" c ON u.id = c.user_id GROUP BY first_name;

// MORE
ALTER TABLE "User" ADD COLUMN is_human BOOLEAN DEFAULT true;

UPDATE "User" SET is_human = false WHERE first_name = 'Danny';

DELETE FROM "User" WHERE is_human = true;

DROP TABLE "Contact";
