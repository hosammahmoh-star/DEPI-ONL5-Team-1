/* =====================================================
   01_create_database.sql
   إنشاء قاعدة البيانات OnlineStoreDB
   ===================================================== */

IF DB_ID('OnlineStoreDB') IS NULL
    CREATE DATABASE OnlineStoreDB;
GO

USE OnlineStoreDB;
GO