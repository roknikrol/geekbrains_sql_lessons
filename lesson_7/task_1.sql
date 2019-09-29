--- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT 
	name
FROM users usr
LEFT JOIN orders as ordr on ordr.user_id = usr.id 
GROUP BY name
HAVING COUNT(DISTINCT ordr.id) >= 1