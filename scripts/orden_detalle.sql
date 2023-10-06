/*SELECT det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
DATEDIFF(oh.DueDate ,oh.OrderDate ) as dias_entrega,
DATEDIFF(oh.ShipDate ,oh.OrderDate ) as dias_envio        
FROM  Sales_SalesOrderDetail as det
join Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
limit 50;*/
/*DATEDIFF(oh.DueDate ,oh.OrderDate ) as dias_entrega,
DATEDIFF(oh.ShipDate ,oh.OrderDate ) as dias_envio  */      

/*

WITH ventas AS(

SELECT det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
oh.DueDate ,
oh.OrderDate , 
oh.ShipDate,
dp.producto_key,
df.fecha_key,
dc.cliente_key,
dv.vendedor_key,
dt.territory_key 
FROM  Sales_SalesOrderDetail as det
JOIN Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
JOIN DWHADVENTURE.dim_cliente as dc on dc.customer_id = oh.CustomerID
JOIN DWHADVENTURE.dim_vendedor AS dv on dv.vendedor_key = oh.SalesPersonID
JOIN DWHADVENTURE.dim_territorio as dt on dt.territory_key = oh.TerritoryID
JOIN DWHADVENTURE.dim_fecha AS df on  df.orderdate = oh.OrderDate 
JOIN DWHADVENTURE.dim_producto AS dp on dp.id_producto = det.ProductID   
)
select * from  ventas
limit 10;*/




SELECT det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
oh.DueDate ,
oh.OrderDate , 
oh.ShipDate
/*dp.producto_key,
df.fecha_key,
dc.cliente_key,
dv.vendedor_key,
dt.territory_key */
FROM  Sales_SalesOrderDetail as det
JOIN Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
JOIN DWHADVENTURE.dim_cliente as dc on dc.customer_id = oh.CustomerID
JOIN DWHADVENTURE.dim_vendedor as dm  on dm.id_empleado = oh.SalesPersonID
JOIN DWHADVENTURE.dim_territorio as dt on dt.id_territory = oh.TerritoryID
/*JOIN DWHADVENTURE.dim_fecha AS df on  df.orderdate = oh.OrderDate */
JOIN DWHADVENTURE.dim_producto AS dp on dp.id_producto = det.ProductID
limit 5; 


