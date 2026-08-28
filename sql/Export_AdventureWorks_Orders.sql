-- ==============================================================================
-- Enterprise Document Automation - Sales Order Data Extraction
-- Target Database: AdventureWorks2022 (MSSQL on Linux/Ubuntu or Windows)
-- Description: Queries SalesOrderHeader and Person tables to produce flat CSV 
--              exports for downstream Word Mail Merge template processing.
-- ==============================================================================

USE AdventureWorks2022;
GO

SELECT 
    so.SalesOrderID,
    CONCAT(p.LastName, ', ', p.FirstName) AS CustomerName,
    CONVERT(VARCHAR(10), so.OrderDate, 120) AS OrderDate, -- ISO 8601: YYYY-MM-DD
    so.TotalDue,
    CASE 
        WHEN so.OnlineOrderFlag = 1 THEN 'Online'
        ELSE 'Reseller'
    END AS OrderType
FROM Sales.SalesOrderHeader so
INNER JOIN Sales.Customer c ON so.CustomerID = c.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE so.OrderDate >= '2026-09-01'
ORDER BY so.OrderDate ASC;
GO
