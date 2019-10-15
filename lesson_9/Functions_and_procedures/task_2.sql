CREATE TRIGGER check_name_descr_insrt BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.name is NULL and NEW.desription is null
	THEN  
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled';
	END IF;
END//

CREATE TRIGGER check_name_descr_upd BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF NEW.name is NULL and NEW.desription is null
	THEN  
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled';
	END IF;
END//


--check
INSERT INTO products(name, desription) VALUES(NULL, NULL), (NULL, 'Macbook'),('Phone', NULL);
SELECT  *	FROM products;