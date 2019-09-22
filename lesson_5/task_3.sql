SELECT product_id, value FROM storehouses_products
ORDER BY value
HAVING value > 0

UNION ALL

SELECT product_id, value FROM storehouses_products
ORDER BY value
HAVING value = 0