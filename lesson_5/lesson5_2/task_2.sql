
/*Count oа birthdays in weekdays*/
select
	 DATE_FORMAT(STR_TO_DATE(CONCAT(DAY(birthday_at),'-',MONTH(birthday_at),'-',YEAR(NOW())),'%d-%m-%Y'),'%a') as bd
    ,COUNT(id)
FROM users
GROUP by bd
ORDER BY FIELD(bd, 'Mon','Tue','Thu','Sat')