--Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
--catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
--идентификатор первичного ключа и содержимое поля name.

DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
	id bigint(20) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
	table_name VARCHAR(50),
	table_prime_key int(10) unsigned not NULL,
	name_from_table VARCHAR(255)
	) ENGINE=Archive


DROP TRIGGER IF EXISTS archive_prod_to_logs;
DELIMITER //
CREATE TRIGGER archive_prod_to_logs AFTER INSERT ON products
FOR EACH ROW
BEGIN
INSERT INTO logs(table_name, table_prime_key, name_from_table) VALUES('products',NEW.id, NEW.name);
END//
DELIMITER ;


DROP TRIGGER IF EXISTS archive_cat_to_logs;
DELIMITER //
CREATE TRIGGER archive_cat_to_logs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
INSERT INTO logs(table_name, table_prime_key, name_from_table) VALUES('catalogs',NEW.id, NEW.name);
END//

DELIMITER ;

INSERT INTO products(name) VALUES('NewProductIPhone');
SELECT * FROM logs;

INSERT INTO catalogs(name) VALUES('Cell_Phones');
SELECT * FROM logs;