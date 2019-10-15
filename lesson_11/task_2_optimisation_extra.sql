---(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

DROP PROCEDURE IF EXISTS one_million_rows
CREATE PROCEDURE one_million_rows()
BEGIN
	DECLARE n BIGINT;
	DECLARE i DATE;
	DECLARE k int;
	SET n = 1000000;
	SET i = NOW();
	SET k = 1;
	WHILE n > 0 DO
	 INSERT INTO users(name,birthday_at) VALUES (CONCAT('user_name',k), i);
	 SET i = i - INTERVAL;
	 SET n = n - 1;
	END WHILE;
END//