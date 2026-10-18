# ITC_ONL5_DAT3_G1_group 1
# 🛒 OnlineStoreDB - End-to-End Retail Sales Data Engineering & BI Analytics

An enterprise-grade Data Engineering and Analytics solution transforming 9,800 raw retail sales records into a highly normalized SQL Server Relational Database, enriched with custom SQL Views, and visualized via an interactive Power BI Dashboard.

---

## 👥 Team Workflows & Division of Labor

- **Data Cleaning:** Initial inspection, missing values treatment, date parsing, and standardizing data formats.
- **Python Data Engineering & Normalization:** Automated script (`onlinestore_data.py`) to split the flat dataset into 4 relational entities (Customers, Products, Orders, OrderDetails).
- **SQL Database Architecture & DDL:** Designing relational tables, primary/foreign keys, and Bulk Insert pipelines.
- **SQL Analytics & Views:** Building analytical queries and reusable SQL Views (`vw_FullOrderReport`, `vw_CustomerSales`, `vw_ProductPerformance`) to streamline reporting.
- **DAX & Power BI Dashboard:** Developing financial/sales measures and designing an executive interactive visual dashboard.

---

## 📐 Architecture & Pipeline Overview

- [ Raw Data (train.csv) ] 
       │
       ▼ (Python / Pandas Automation & Normalization)
- [ Cleaned & Relational CSV Files ] 
       │
       ▼ (SQL Server / SSMS Architecture & Constraints)
- [ OnlineStoreDB Relational Database ]
       │
       ├──► (SQL Analytics & Analytical Views)
       └──► (Power BI Executive Dashboard)

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

Sales-Dashboard-Connected-to-SQL/
│
├── 01_Python_Cleaning/
│   ├── mini_project.py
│   ├── train.csv
│   └── train_cleaned.csv
│
├── 02_python_processing/
│   ├── customers.csv
│   ├── onlinestore_data.py
│   ├── order_details.csv
│   └── orders.csv
│   ├── products.csv
│   └── train_cleaned.csv
│
├── 03_sql_database/
│   ├── 1-create_database.sql
│   ├── 2-create_tables.sql
│   ├── 3-import_customers_products.sql
│   ├── 4-import_orders_details.sql
│   ├── 5-create_views.sql
│   └── 6-analytical_queries.sql
│
└── README.md

---

## ⚙️ How to Run & Reproduce

1. **Python Cleaning & Processing:** Run scripts in `01_Python_Cleaning` and `02_python_processing` to generate relational CSVs.
2. **Database Setup:** Execute SQL scripts `1` through `6` sequentially in **SQL Server Management Studio (SSMS)**.
3. **Power BI Integration:** Connect Power BI to the `OnlineStoreDB` server instance using the prepared tables and views.
   🌐 **Live AI Data Assistant (Interactive Web App):** 
[👉 اضغط هنا لتشغيل الشات التفاعلي أونلاين](https://hosammahmoh-star.github.io/DEPI-ONL5-Team-1/mini%20project/Sales-Dashboard-Connected-to-SQL/05_Interactive_Web_App/)
