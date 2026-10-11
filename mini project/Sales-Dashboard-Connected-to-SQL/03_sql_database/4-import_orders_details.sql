/* =====================================================
   04_import_orders_details.sql
   استيراد Orders و OrderDetails (الجداول الابن)
   شغّله بعد 03_import_customers_products.sql
   ملحوظة: غيّر المسار C:\OnlineStore\data\ لمكان ملفات الـ CSV على جهازك
   ===================================================== */

USE OnlineStoreDB;
GO

/* تفضية الجدولين (الابن الأول) عشان السكريبت يتشغّل أكتر من مرة */
DELETE FROM OrderDetails;
DELETE FROM Orders;
GO

BULK INSERT Orders
FROM 'C:\OnlineStore\data\orders.csv'
WITH (FORMAT='CSV', FIELDQUOTE='"', FIRSTROW=2, CODEPAGE='65001', KEEPNULLS, TABLOCK);

BULK INSERT OrderDetails
FROM 'C:\OnlineStore\data\order_details.csv'
WITH (FORMAT='CSV', FIELDQUOTE='"', FIRSTROW=2, CODEPAGE='65001', TABLOCK);
GO

/* تحقق: المفروض 793 و 1861 و 4922 و 9800 */
SELECT 'Customers'    AS TableName, COUNT(*) AS Total FROM Customers    UNION ALL
SELECT 'Products',                  COUNT(*)          FROM Products     UNION ALL
SELECT 'Orders',                    COUNT(*)          FROM Orders       UNION ALL
SELECT 'OrderDetails',              COUNT(*)          FROM OrderDetails;
GO