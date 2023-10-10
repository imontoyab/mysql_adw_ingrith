INSERT INTO  DWHADVENTURE.dim_producto (id_producto, nombre_producto, numero_producto , id_subcategoria , nombre_subcategoria, id_categoria , nombre_categoria  )
SELECT pp.ProductID id_producto, 
pp.Name nombre_producto,
pp.ProductNumber numero_producto,
sbc.ProductSubcategoryID id_subcategoria, 
sbc.Name nombre_subcategoria, 
pc.ProductCategoryID id_categoria,
pc.Name nombre_categoria 
FROM  Production_Product as pp
join  Production_ProductSubcategory as sbc on sbc.ProductSubcategoryID = pp.productsubcategoryid
join  Production_ProductCategory as pc on pc.ProductCategoryID  = sbc.ProductCategoryID ;