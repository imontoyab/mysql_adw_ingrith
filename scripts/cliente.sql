/*SELECT distinct det.SalesOrderID id_dtll_venta, 
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
limit 5; */

/*

WITH CLIENTE AS (
SELECT comp.CustomerID,
per.FirstName,
per.MiddleName,
per.LastName, 
terr.TerritoryID,
terr.Name ,
terr.CountryRegionCode,
terr.Group
FROM  Sales_Customer as comp
join Person_Person as per on  per.BusinessEntityID = comp.CustomerID
join  Sales_SalesTerritory as terr on terr. TerritoryID = comp.TerritoryID 
), cliente_adw as(

select c.CustomerID,
concat (c.FirstName, ' ',c.MiddleName, ' ', c.LastName)  as nombre_cliente,
c.TerritoryID
from  CLIENTE as c
)  
SELECT * FROM cliente_adw; */


INSERT INTO  DWHADVENTURE.dim_cliente ( customer_id ,nombre_cliente, territory_id 
)
WITH CLIENTE AS (

SELECT comp.CustomerID,
per.FirstName,
per.MiddleName,
per.LastName, 
comp.TerritoryID
FROM  Sales_Customer as comp
join Person_Person as per on per.BusinessEntityID = comp.PersonID
), cliente_adw as(
select c.CustomerID ,
concat (c.FirstName, ' ', c.LastName)  as nombre_cliente,
c.TerritoryID 
from  CLIENTE as c
)  
SELECT * FROM cliente_adw ; 

