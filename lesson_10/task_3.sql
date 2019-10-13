--Построить запрос, который будет выводить следующие столбцы:
--имя группы
--среднее количество пользователей в группах
--самый молодой пользователь в группе
--самый пожилой пользователь в группе
--общее количество пользователей в группе
--всего пользователей в системе
--отношение в процентах 
--	(общее количество пользователей в группе / всего пользователей в системе) * 100

SELECT DISTINCT
	  com.name
	, AVG(*) OVER w 'среднее количество пользователей в группах'
	, FIRST(prf.user_id) OVER bdy 'самый молодой пользователь в группе'
	, FIRST(prf.user_id) OVER bdo 'самый пожилой пользователь в группе'
	, COUNT(DISTINCT *) OVER w 'общее количество пользователей в группе'
	, COUNT(DISTINCT prf.user_id) OVER w 'общее количество пользователей в группе' 
	, COUNT(DISTINCT prf.user_id) OVER() 'общее количество пользователей в системе'
	
FROM vk.communities_users com_u
LEFT JOIN communities com on com.community_id = com_u.community_id 
LEFT JOIN profiles prf on prf.user_id_id = com_u.user_id
WINDOW w AS (PARTITION BY prf.user_id)
WINDOW bdy AS (PARTITION BY LEFT(prf.birthday, 4) ORDER BY prf.birthday)
WINDOW bdo AS (PARTITION BY LEFT(prf.birthday, 4) ORDER BY prf.birthday DESC)