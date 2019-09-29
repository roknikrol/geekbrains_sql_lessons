--- Улучшения запросов
---1
SELECT
  first_name,
  last_name,
  (SELECT filename FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = 1)
  ),
  (SELECT hometown FROM profiles WHERE user_id = 1)
  FROM users
    WHERE id = 1; 
	
--заменить user_id = 1 в подзапросах на user_id = users.id 
SELECT
  first_name,
  last_name,
  (SELECT filename FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = users.id )
  ),
  (SELECT hometown FROM profiles WHERE user_id = users.id )
  FROM users
    WHERE id = 1; 
	