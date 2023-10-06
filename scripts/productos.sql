/*SELECT det.SalesOrderID id_dtll_venta, 
pp.ProductID id_producto, 
pp.Name nombre_producto,
pp.ProductNumber numero_producto,
sbc.ProductSubcategoryID id_subcategoria, 
sbc.Name nombre_subcategoria, 
pc.ProductCategoryID id_categoria,
pc.Name nombre_categoria 
FROM  Sales_SalesOrderDetail as det
join  Production_Product as pp on  det.ProductID = pp.ProductID
join  Production_ProductSubcategory as sbc on sbc.ProductSubcategoryID = pp.productsubcategoryid
join  Production_ProductCategory as pc on pc.ProductCategoryID  = sbc.ProductCategoryID 
where det.SalesOrderID = 51081
limit 100;   */     

/*


SELECT pp.ProductID id_producto, 
pp.Name nombre_producto,
pp.ProductNumber numero_producto,
sbc.ProductSubcategoryID id_subcategoria, 
sbc.Name nombre_subcategoria, 
pc.ProductCategoryID id_categoria,
pc.Name nombre_categoria 
FROM  Production_Product as pp
join  Production_ProductSubcategory as sbc on sbc.ProductSubcategoryID = pp.productsubcategoryid
join  Production_ProductCategory as pc on pc.ProductCategoryID  = sbc.ProductCategoryID ; */


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