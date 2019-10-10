START TRANSACTION;

INSERT INTO sample.users(id, name) SELECT id, name FROM shop_sql_practice.users WHERE users.id = 1;
DELETE FROM shop_sql_practice.users WHERE users.id = 1;

COMMIT;