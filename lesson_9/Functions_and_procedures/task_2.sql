CREATE TRIGGER check_name_descr BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	SET NEW.name = COALESCE(NEW.name, 'без названия');
	SET NEW.desription = COALESCE(NEW.desription, 'без названия');
END//


--check
INSERT INTO products(name, desription) VALUES(NULL, NULL), (NULL, 'Macbook'),('Phone', NULL);
SELECT  *	FROM products;