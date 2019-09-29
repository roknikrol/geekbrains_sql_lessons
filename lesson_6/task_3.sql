-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

 SELECT
     CONCAT(first_name, ' ', last_name) name 
    ,(SELECT birthday FROM profiles where user_id = users.id) bday
    ,(SELECT COUNT(DISTINCT id) FROM likes where user_id = users.id ) likes_count
   FROM users
   Order by bday DESC
   LIMIT 10