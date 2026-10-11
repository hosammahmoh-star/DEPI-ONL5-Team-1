/* =====================================================
   02_create_tables.sql
   إنشاء جداول OnlineStoreDB مع الـ Primary Keys والـ Foreign Keys
   ===================================================== */

USE OnlineStoreDB;
GO

/* حذف الجداول لو موجودة (الابن الأول) عشان السكريبت يتشغّل أكتر من مرة */
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
GO

/* 1) Customers */
CREATE TABLE Customers (
    CustomerID   VARCHAR(20)   NOT NULL,
    CustomerName NVARCHAR(100) NOT NULL,
    Segment      VARCHAR(30)   NOT NULL,
    CONSTRAINT PK_Customers PRIMARY KEY (CustomerID)
);

/* 2) Products */
CREATE TABLE Products (
    ProductID   VARCHAR(30)   NOT NULL,
    ProductName NVARCHAR(255) NOT NULL,
    Category    VARCHAR(50)   NOT NULL,
    SubCategory VARCHAR(50)   NOT NULL,
    CONSTRAINT PK_Products PRIMARY KEY (ProductID)
);

/* 3) Orders (بتشاور على Customers) */
CREATE TABLE Orders (
    OrderID    VARCHAR(30) NOT NULL,
    OrderDate  DATE        NOT NULL,
    ShipDate   DATE        NOT NULL,
    ShipMode   VARCHAR(30) NOT NULL,
    CustomerID VARCHAR(20) NOT NULL,
    Country    VARCHAR(50) NOT NULL,
    City       VARCHAR(60) NOT NULL,
    State      VARCHAR(60) NOT NULL,
    PostalCode VARCHAR(10) NULL,
    Region     VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

/* 4) OrderDetails (بتشاور على Orders و Products) */
CREATE TABLE OrderDetails (
    RowID     INT           NOT NULL,
    OrderID   VARCHAR(30)   NOT NULL,
    ProductID VARCHAR(30)   NOT NULL,
    Sales     DECIMAL(12,4) NOT NULL,
    CONSTRAINT PK_OrderDetails PRIMARY KEY (RowID),
    CONSTRAINT FK_OD_Orders   FOREIGN KEY (OrderID)   REFERENCES Orders(OrderID),
    CONSTRAINT FK_OD_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO