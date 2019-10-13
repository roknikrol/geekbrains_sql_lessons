--Задания на БД vk:
--Проанализировать какие запросы могут выполняться наиболее часто в процессе работы
--приложения и добавить необходимые индексы.

-- вывод пользователей у которых сегодня день рождения

SELECT 
	 users.id
	,CONCAT(first_name, ' ', last_name) name
FROM users
JOIN profiles on profiles.user_id = users.id
WHERE profiles.birthday = DATE_FORMAT(NOW(), '%Y-%m-%d')

CREATE INDEX profiles_birthday_idx ON profiles(birthday)

