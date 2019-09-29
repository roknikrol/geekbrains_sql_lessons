/*change auto_generated values to real values*/

TRUNCATE target_types;

INSERT INTO target_types VALUES
(1,'post',NOW()),
(2,'picture',NOW()),
(3,'game',NOW()),
(4,'profile',NOW()),
(5,'newsletter',NOW()),
(6,'status_update',NOW()),
(7,'video',NOW()),
(8,'music',NOW()),
(9,'drawing',NOW()),
(10,'profile_update',NOW())


/*Top 10 users by likes*/
SELECT
	 CONCAT(users.firstname , ' ', users.lastname) as 'User name'
	,COUNT(DISTINCT likes.id) as 'likes count'
FROM users
LEFT JOIN likes on likes.user_id = users.id
GROUP BY
	CONCAT(users.firstname , ' ', users.lastname)
ORDER BY COUNT(DISTINCT likes.id) DESC
LIMIT 10



--populate region_id in profiles table with random numbers

UPDATE profiles SET region_id = FLOOR(RAND()*(100-11))

-- check 
select DISTINCT region_id, user_id FROM profiles order BY region_id

--a 0 value was inserted (user_id = 92), update manually
UPDATE profiles SET region_id = 1 where user_id = 92


/*top 10 countries with most posts*/
SELECT
	 regions.name AS 'Region name'
	,COUNT(DISTINCT posts.id) as 'Posts count'
FROM posts
LEFT JOIN profiles on profiles.user_id = posts.user_id
LEFT JOIN regions on regions.id = profiles.region_id

GROUP BY
	regions.name
ORDER BY COUNT(DISTINCT posts.id)  DESC
LIMIT 10