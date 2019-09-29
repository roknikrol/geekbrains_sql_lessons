--Пусть задан некоторый пользователь. 
--Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим 
--пользоваетелем.

SELECT
	CONCAT(first_name, ' ',last_name) as name
   ,(SELECT CONCAT(first_name, ' ',last_name) from users where id = 
   			(SELECT from_user_id
           		  FROM(SELECT from_user_id, COUNT(id) idcount
           		       FROM messages
           	           where to_user_id = 2
                       GROUP BY 
                       from_user_id) mes
                  group by from_user_id
                  order by idcount DESC
                  LIMIT 1
            )
   ) top_messager								  
FROM users
where id = 2;