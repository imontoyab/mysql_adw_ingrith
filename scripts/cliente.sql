SELECT det.SalesOrderID id_dtll_venta, 
comp.CustomerID,
concat (per.FirstName, ' ',per.MiddleName, ' ', per.LastName)  as nombre_cliente,
terr.TerritoryID,
terr.Name nombre_territorio,
terr.CountryRegionCode  cod_region,
terr.Group grupo_region
FROM  Sales_SalesOrderDetail as det
join Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
join  Sales_Customer as comp on comp.CustomerID = oh.CustomerID
join Person_Person as per on  per.BusinessEntityID = comp.CustomerID
join  Sales_SalesTerritory as terr on oh.TerritoryID = comp.TerritoryID
limit 5; 