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

