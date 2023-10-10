INSERT INTO DWHADVENTURE.dim_vendedor ( id_empleado, identificacion ,  nombre_empleado, fecha_nac , genero  , 
fecha_contratacion, territory_id )
WITH vendedor AS(
select 
emp.BusinessEntityID id_empleado,
emp.NationalIDNumber  identificacion,
per.FirstName, 
per.LastName, 
emp.BirthDate fecha_nac,
emp.Gender   genero,
emp.HireDate fecha_contratacion, 
IFNULL(sp.TerritoryID, 0) TerritoryID
FROM HumanResources_Employee as emp 
JOIN  Person_Person as per on per.BusinessEntityID = emp.BusinessEntityID
JOIN  Sales_SalesPerson sp on sp.BusinessEntityID = per.BusinessEntityID 
), vendedor_adw AS(
SELECT v.id_empleado, 
v.identificacion,
CONCAT(v.FirstName, ' ',v.LastName) as nombre_empleado, 
v.fecha_nac, 
v.genero, 
v.fecha_contratacion, 
v.TerritoryID
FROM vendedor as v
) 
SELECT * FROM vendedor_adw; 

insert into DWHADVENTURE.dim_vendedor (  id_empleado, identificacion ,  nombre_empleado, fecha_nac , genero  , 
fecha_contratacion, territory_id)
values (00, 00, 'NOIDENTIFICADO', '1900/01/01', 'X', '1900/01/01', 00 ); 
COMMIT; 
