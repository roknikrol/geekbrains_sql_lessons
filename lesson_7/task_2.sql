--- Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT 
	prd.name
,	cat.name
FROM products prd
LEFT JOIN catalogs as cat on cat.id = prd.catalog_id 
