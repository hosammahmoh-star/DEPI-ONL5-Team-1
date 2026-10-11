# ITC_ONL5_DAT3_G1_group-_1
## OnlineStoreDB SQL SERVER

SQL Server database built from a cleaned Superstore-style sales file (`train_cleaned.csv`, 9,800 rows).
The flat file is split into 4 related tables.

## Tables

| Table | Primary Key | Foreign Keys | Rows |
|---|---|---|---|
| Customers | CustomerID | - | 793 |
| Products | ProductID | - | 1,861 |
| Orders | OrderID | CustomerID -> Customers | 4,922 |
| OrderDetails | RowID | OrderID -> Orders, ProductID -> Products | 9,800 |

## Design decisions

- Shipping address (City, State, PostalCode, Region) lives in `Orders`, because a customer appears with up to 15 different cities.
- `OrderDetails` uses `RowID` as primary key, because the same product appears twice in the same order in 8 rows.
- 32 ProductIDs had two different names; the most frequent name was kept for each.
- `PostalCode` allows NULL (6 orders have no postal code).

## Scripts (`02_SQL_Scripts/`)

Run them in this order:

1. `01_create_database.sql` creates the `OnlineStoreDB` database.
2. `02_create_tables.sql` creates the 4 tables with PK/FK constraints.
3. `onlinestore_data.py` splits `train_cleaned.csv` into 4 CSV files (needs `pandas`).
4. `03_import_customers_products.sql` loads Customers and Products.
5. `04_import_orders_details.sql` loads Orders and OrderDetails.

Before step 4, change the path `C:\OnlineStore\data\` inside the import scripts to the folder that holds the CSV files.

## Verification

After importing, the row counts should be 793 / 1861 / 4922 / 9800, and a LEFT JOIN check for orphan rows
(orders without a customer, order lines without a product) should return 0.

## Tools

SQL Server 2025, SSMS 22, Python with pandas.
