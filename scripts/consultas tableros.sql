/*SELECT  comp. (TotalDue  - th.ActualCost) ganancia
FROM  Sales_SalesOrderDetail as det
join Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
join  Sales_Customer as comp on comp.CustomerID = oh.CustomerID
join Person_Person as per on  per.BusinessEntityID = comp.CustomerID
join  Sales_SalesTerritory as terr on oh.TerritoryID = comp.TerritoryID
join  Production_TransactionHistory th on th.ProductID = det.ProductID         
limit 5; */


/*SELECT FORMAT(SUM(LineTotal),'#,0.00') AS TotalSales FROM  Sales_SalesOrderDetail ;*/
/*SELECT  LineTotal  FROM Sales_SalesOrderDetail limit 20;*/


SELECT * FROM  Sales_SalesTerritory  LIMIT 2;       
