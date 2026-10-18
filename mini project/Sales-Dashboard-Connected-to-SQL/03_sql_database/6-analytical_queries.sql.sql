USE OnlineStoreDB;
GO

-- 1) أعلى 10 عملاء شراءً وتحليل القيمة (Top 10 Customers by Revenue)
SELECT TOP 10 
    c.CustomerID, 
    c.CustomerName, 
    c.Segment,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Sales) AS TotalSpent,
    ROUND(AVG(od.Sales), 2) AS AvgOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName, c.Segment
ORDER BY TotalSpent DESC;

-- 2) المبيعات ونسبة المساهمة لكل فئة منتجات (Category Sales Contribution %)
SELECT 
    p.Category,
    SUM(od.Sales) AS TotalSales,
    ROUND((SUM(od.Sales) * 100.0) / (SELECT SUM(Sales) FROM OrderDetails), 2) AS SalesContributionPercentage
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.Category
ORDER BY TotalSales DESC;

-- 3) تحليل وقت الشحن حسب المنطقة وطريقة الشحن (Logistics & Shipping Performance)
SELECT 
    o.Region,
    o.ShipMode,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    AVG(DATEDIFF(day, o.OrderDate, o.ShipDate)) AS AvgDeliveryDays
FROM Orders o
GROUP BY o.Region, o.ShipMode
ORDER BY o.Region, AvgDeliveryDays;