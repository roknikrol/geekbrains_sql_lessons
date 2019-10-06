---- Определить кто больше поставил лайков (всего) - мужчины или женщины?
   SELECT
     case when sex = 1 then 'man' else 'woman' end as sex    ----- у меня сгенерировалаось так, что пол это 1 или 0
    ,COUNT(DISTINCT likes.id) likes_count
   FROM likes
   JOIN profiles prf on prf.user_id = likes.user_id
   group by sex
   order by likes_count DESC
   LIMIT 1 
   
   
 SELECT
     case when sex = 1 then 'man' else 'woman' end as sex    ----- у меня сгенерировалаось так, что пол это 1 или 0
    ,SUM((SELECT COUNT(DISTINCT id) FROM likes where user_id = profiles.user_id )) likes_count
   FROM profiles
   group by sex
   order by likes_count DESC
   LIMIT 1 