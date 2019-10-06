---Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

--- Пусть активность пользователей это среднее значение количества всех лайков, media файлов и сообщений пользователя.
SELECT
	 CONCAT(first_name, ' ', last_name) as name
	,COUNT(DISTINCT lks.id) likes_count
	,COUNT(DISTINCT med.id) media_count
	,COUNT(DISTINCT msg.id) messages_count
    ,(COUNT(DISTINCT lks.id) 
		+COUNT(DISTINCT med.id)
		+COUNT(DISTINCT msg.id))/3  activity ---- находим среднее как сумма 3 показателей деленое на 3
FROM likes lks, 
	media med, 
	messages msg,
	users usr
where 
	lks.user_id = usr.id
and med.user_id = usr.id
and msg.from_user_id = usr.id

GROUP by 
	CONCAT(first_name, ' ', last_name)
ORDER BY activity, CONCAT(first_name, ' ', last_name)
LIMIT 10;



---старый запрос

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