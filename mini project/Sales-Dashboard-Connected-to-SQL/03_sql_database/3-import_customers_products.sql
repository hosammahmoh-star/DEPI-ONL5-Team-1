/* =====================================================
   03_import_customers_products.sql
   استيراد Customers و Products (الجداول الأب)
   ملحوظة: غيّر المسار C:\OnlineStore\data\ لمكان ملفات الـ CSV على جهازك
   ===================================================== */

USE OnlineStoreDB;
GO

/* تفضية الجداول (الابن الأول) عشان السكريبت يتشغّل أكتر من مرة */
DELETE FROM OrderDetails;
DELETE FROM Orders;
DELETE FROM Products;
DELETE FROM Customers;
GO

BULK INSERT Customers
FROM 'C:\OnlineStore\data\customers.csv'
WITH (FORMAT='CSV', FIELDQUOTE='"', FIRSTROW=2, CODEPAGE='65001', TABLOCK);

BULK INSERT Products
FROM 'C:\OnlineStore\data\products.csv'
WITH (FORMAT='CSV', FIELDQUOTE='"', FIRSTROW=2, CODEPAGE='65001', TABLOCK);
GO

/* تحقق: المفروض 793 و 1861 */
SELECT 'Customers' AS TableName, COUNT(*) AS Total FROM Customers UNION ALL
SELECT 'Products',               COUNT(*)          FROM Products;
GO