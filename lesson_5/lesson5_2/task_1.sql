select
	FLOOR(AVG(DATEDIFF(NOW(),birthday_at)/365))
FROM users