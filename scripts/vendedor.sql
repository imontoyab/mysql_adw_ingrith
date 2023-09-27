select distinct det.SalesOrderID,
emp.BusinessEntityID id_empleado,
emp.NationalIDNumber  identificacion,
concat (per.FirstName, ' ',per.MiddleName, ' ', per.LastName)  as nombre_empleado,
emp.BirthDate fecha_nac,
emp.Gender   genero,
emp.HireDate fecha_contratacion, 
terr.TerritoryID,
terr.Name nombre_territorio,
terr.CountryRegionCode  cod_region,
terr.Group grupo_region   
FROM  Sales_SalesOrderDetail as det
join Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
join  HumanResources_Employee as emp on emp.BusinessEntityID = oh.SalesPersonID
join  Person_Person as per on  per.BusinessEntityID = emp.BusinessEntityID  
join  Sales_SalesTerritory as terr on oh.TerritoryID = terr.TerritoryID  
limit 5; 

