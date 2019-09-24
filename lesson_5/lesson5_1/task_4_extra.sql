----select users who were born in may and august in month-word format
SELECT
	 name
FROM users
WHERE 
	DATE_FORMAT(birthday_at, '%M') in ('may', 'august')