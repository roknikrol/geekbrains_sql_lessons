--Пусть задан некоторый пользователь. 
--Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим 
--пользоваетелем.

-- новый запрос

SELECT
	 CONCAT(usr_to.first_name, ' ',usr_to.last_name) as name	
    ,CONCAT(usr_from.first_name, ' ',usr_from.last_name) as top_messanger

FROM messages msg
JOIN users usr_to on msg.to_user_id = usr_to.id
JOIN users usr_from on msg.from_user_id = usr_from.id  
JOIN friendship frnd on (msg.from_user_id = frnd.friend_id and frnd.status_id = 1)
where usr_to.id = 1
GROUP BY 
 	 CONCAT(usr_to.first_name, ' ',usr_to.last_name)	
	,CONCAT(usr_from.first_name, ' ',usr_from.last_name)
ORDER BY COUNT(msg.id) DESC
LIMIT 1



-- старый запрос
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
FROM users usr
JOIN messages msg on msg.from_user_id = usr.id
JOIN friendships frnd on msg.from_user_id = frnd.friend_id
where id = 2;

