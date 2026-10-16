USE OnlineStoreDB;
GO

-- 1) التقرير الشامل (Full Order Report)
CREATE VIEW vw_FullOrderReport AS
SELECT 
    od.RowID, o.OrderID, o.OrderDate, o.ShipDate, o.ShipMode,
    c.CustomerID, c.CustomerName, c.Segment,
    o.Country, o.City, o.State, o.PostalCode, o.Region,
    p.ProductID, p.ProductName, p.Category, p.SubCategory,
    od.Sales
FROM OrderDetails od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Products p ON od.ProductID = p.ProductID;
GO

-- 2) تقرير مبيعات العملاء (Customer Sales)
CREATE VIEW vw_CustomerSales AS
SELECT 
    c.CustomerID, c.CustomerName, c.Segment,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Sales) AS TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName, c.Segment;
GO

-- 3) تقرير أداء المنتجات (Product Performance)
CREATE VIEW vw_ProductPerformance AS
SELECT 
    p.ProductID, p.ProductName, p.Category, p.SubCategory,
    COUNT(od.OrderID) AS TimesOrdered,
    SUM(od.Sales) AS TotalRevenue
FROM Products p
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category, p.SubCategory;
GO