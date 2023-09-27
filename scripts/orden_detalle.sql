SELECT det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
DATEDIFF(oh.DueDate ,oh.OrderDate ) as dias_entrega,
DATEDIFF(oh.ShipDate ,oh.OrderDate ) as dias_envio        
FROM  Sales_SalesOrderDetail as det
join Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
limit 50;