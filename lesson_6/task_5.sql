---Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

--- Пусть активность пользователей это среднее значение количества всех лайков, media файлов и сообщений пользователя.

SELECT
	 CONCAT(first_name, ' ', last_name) as name
	,(SELECT COUNT(DISTINCT id) FROM likes WHERE user_id = users.id) likes_count
	,(SELECT COUNT(DISTINCT id) FROM media WHERE user_id = users.id) media_count
	,(SELECT COUNT(DISTINCT id) FROM messages WHERE from_user_id = users.id) messages_count
    ,((SELECT COUNT(DISTINCT id) FROM likes WHERE user_id = users.id)
       + (SELECT COUNT(DISTINCT id) FROM media WHERE user_id = users.id)
       + (SELECT COUNT(DISTINCT id) FROM messages WHERE from_user_id = users.id))/3  activity
FROM users
ORDER BY activity
LIMIT 10