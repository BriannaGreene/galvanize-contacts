CREATE DATABASE galvanize_contracts;

CREATE USER galvanize_admin PASSWORD 'galvanize_P@$$w0rd';

REVOKE ALL PRIVILEGES ON DATABASE galvanize_contracts FROM PUBLIC;

GRANT USAGE ON SCHEMA public TO PUBLIC;

ALTER USER galvanize_admin WITH SUPERUSER;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO galvanize_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO galvanize_admin;

pg_dumpall -r > database_roles.sql;

CREATE TABLE "User"(id SERIAL PRIMARY KEY, first_name VARCHAR, last_name VARCHAR, date_of_birth VARCHAR, biography VARCHAR);

INSERT INTO "User"(first_name, last_name, date_of_birth, biography) VALUES ('Kyle', 'Coberly', 'born on 2/18/1961', 'Web app developer, business dork, amateur economist');

INSERT INTO "User"(first_name, last_name, date_of_birth, biography) VALUES ('CJ', 'Reynolds', 'born on 4/28/2031', 'Does the man have the moustache, or does the moustache have the man?');

INSERT INTO "User"(first_name, last_name, date_of_birth, biography) VALUES ('Danny', 'Fritz', 'born on 9/15/1805', 'Definitely a human instructor, not a
robot.');

INSERT INTO "User"(first_name, last_name, date_of_birth, biography) VALUES ('Roberto', 'Ortega', 'born on 10/17/2015', 'Llamas age faster than people.');

CREATE TABLE "Contact"(id SERIAL PRIMARY KEY, type VARCHAR NOT NULL, value VARCHAR NOT NULL, user_id VARCHAR);

INSERT INTO "Contact"(type, value, user_id) VALUES ('email', 'kyle.coberly@galvanize.com', 1);

INSERT INTO "Contact"(type, value, user_id) VALUES ('phone', 911, 1), ('email', 'cj.reynolds@galvanize.com', 2), ('email', 'danny.fritz@galvanize.com', 3), ('phone', 0, 3), ('email', 'roberto.ortega@galvanize.com', 4);

pg_dump galvanize_contracts > database_dump.sql;
SELECT * FROM "User" WHERE date_of_birth >
