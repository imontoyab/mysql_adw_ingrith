INSERT INTO  DWHADVENTURE.dim_territorio(id_territory,  name_territory, CountryRegionCode,  group_territory )
SELECT terr.TerritoryID, 
terr.Name, 
terr.CountryRegionCode, 
terr.Group  
FROM Sales_SalesTerritory as terr;