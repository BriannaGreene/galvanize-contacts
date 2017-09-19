SELECT first_name, last_name FROM "User" WHERE date_of_birth >= '2000-01-01' ORDER BY first_name DESC;

SELECT biography FROM "User" WHERE biography LIKE '%man%';

SELECT first_name, last_name, type, value FROM "User" u INNER JOIN "Contact" c ON u.id = c.user_id WHERE u.first_name = 'Danny';

SELECT first_name FROM "User" WHERE first_name = 'Danny' OR first_name = 'Kyle';

SELECT first_name, COUNT(type) FROM "User" u INNER JOIN "Contact" c ON u.id = c.user_id GROUP BY first_name;
