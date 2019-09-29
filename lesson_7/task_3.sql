--- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
--Поля from, to и label содержат английские названия городов, поле name — русское. 
--Выведите список рейсов flights с русскими названиями городов.

SELECT
	fl.id
,	cit_from.name
,	cit_to.name

FROM flights fl
LEFT JOIN cities cit_from on cit_from.label = fl.from 
LEFT JOIN cities cit_to on cit_to.label = fl.to 