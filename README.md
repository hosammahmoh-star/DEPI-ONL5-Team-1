# ITC_ONL5_DAT3_G1_group 1
# 🛒 OnlineStoreDB - End-to-End Retail Sales Data Engineering & BI Analytics

An enterprise-grade Data Engineering and Analytics solution transforming 9,800 raw retail sales records into a highly normalized SQL Server Relational Database, enriched with custom SQL Views, and visualized via an interactive Power BI Dashboard & Client-Side Web Application.

---

## 📐 Architecture & Pipeline Overview

- [ Raw Data (train.csv) ] 
       │
       ▼ (Python / Pandas Automation & Normalization)
- [ 4 Cleaned CSV Files ] 
       │
       ▼ (SQL Server 2025 / SSMS Architecture & Constraints)
- [ OnlineStoreDB Relational Database ]
       │
       ├──► (SQL Analytics & Analytical Views)
       ├──► (Power BI Executive Dashboard)
       └──► (Interactive Client-Side HTML/JS Web Platform)

---

## 📊 Key Business & Financial Insights (EDA Highlights)

- **Total Revenue:** $2,261,536.78
- **Total Orders Processed:** 4,922 Orders
- **Total Customer Base:** 793 Unique Customers
- **Total Product Portfolio:** 1,861 Products
- **Category Sales Leader:** Technology ($827,455.87 ~ 36.58%), followed by Furniture ($728,658.58 ~ 32.22%) and Office Supplies ($705,422.33 ~ 31.20%).
- **Top Regional Market:** West Region ($710,219.68 ~ 31.40%), followed by East Region ($669,518.73 ~ 29.60%).

---

## 📂 Repository Structure

OnlineStoreDB-Analytics/
│
├── 01_Python_Processing/         # Cleaning scripts & CSV generation logic
│   ├── train_cleaned.csv
│   └── onlinestore_data.py
│
├── 02_SQL_Database/              # DDL, DML, Bulk Insert, & Analytical Views
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_import_customers_products.sql
│   ├── 04_import_orders_details.sql
│   ├── 05_create_views.sql
│   └── 06_analytical_queries.sql
│
├── 03_PowerBI_Dashboard/         # Power BI report files & visual assets
│   └── OnlineStore_Sales_Dashboard.pbix
│
├── 04_Interactive_Web_App/       # Client-side web portal & interactive analytics
│   ├── index.html
│   ├── styles.css
│   └── app.js
│
└── README.md

---

## ⚙️ How to Run & Reproduce

1. **Python Data Pipeline:** Run `onlinestore_data.py` to process `train_cleaned.csv` into 4 relational CSV files (customers, products, orders, order_details).
2. **Database Setup:** Execute scripts 01 through 05 in order within SQL Server Management Studio (SSMS).
3. **Power BI Integration:** Open `OnlineStore_Sales_Dashboard.pbix` and connect to the local OnlineStoreDB server instance.
