CREATE 
	VIEW product_catalog 
	AS
	SELECT products.name 'product_name', catalogs.name 'catalog_name'
	FROM products
	LEFT JOIN catalogs on products.catalog_id = catalogs.id