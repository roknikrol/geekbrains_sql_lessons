-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

 SELECT
     CONCAT(usr.first_name, ' ', usr.last_name) name 
    ,prf.birthday bday
    ,COUNT(DISTINCT likes.id) likes_count
   FROM likes 
   JOIN users usr on usr.id = likes.user_id
   JOIN profiles prf on prf.user_id = likes.user_id
   GROUP by 
         CONCAT(usr.first_name, ' ', usr.last_name) 
    	,prf.birthday 
   Order by bday DESC
   LIMIT 10





---старый запрос 

 SELECT
     CONCAT(first_name, ' ', last_name) name 
    ,(SELECT birthday FROM profiles where user_id = users.id) bday
    ,(SELECT COUNT(DISTINCT id) FROM likes where user_id = users.id ) likes_count
   FROM users
   Order by bday DESC
   LIMIT 10