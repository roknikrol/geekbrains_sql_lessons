--Правильно-ли он построен?
--Какие изменения, включая денормализацию, можно внести в структуру БД
--чтобы существенно повысить скорость работы этого запроса?
--Задание на денормализацию
--Разобраться как построен и работает следующий запрос:
SELECT 
	media.filename,
	target_types.name,
	COUNT(*) AS total_likes,
	CONCAT(first_name, ' ', last_name) AS owner
FROM media
JOIN likes
	ON media.id = likes.target_id
JOIN target_types
	ON (likes.target_type_id = target_types.id AND target_types.id = 1)
JOIN users
	ON users.id = media.user_id
WHERE 
	users.id = 2 
GROUP BY media.id;

--- 1. создать в таблице media триггер cчитающий количество лайков likes_count
ALTER TABLE media ADD COLUMN likes_count INT;
CREATE TRIGGER likes_count BEFORE INSERT ON media
FOR EACH ROW
BEGIN
	SELECT COUNT(DISTINCT likes.id) INTO likes_count FROM likes
	JOIN media on media.user_id = likes.target_id
END//

-- 2. добавить постоянный столбец target_types в таблице media

	