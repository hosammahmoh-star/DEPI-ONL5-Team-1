import pandas as pd
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
src = os.path.join(BASE_DIR, "train_cleaned.csv")
out = r"C:\OnlineStore\data"
os.makedirs(out, exist_ok=True)

df = pd.read_csv(src)
df["Postal Code"] = df["Postal Code"].astype("Int64").astype("string")

# 1) Customers
customers = df[["Customer ID", "Customer Name", "Segment"]].drop_duplicates("Customer ID")
customers.columns = ["CustomerID", "CustomerName", "Segment"]

# 2) Products (اسم واحد لكل ID، الأكتر تكراراً)
products = (df.groupby("Product ID")
              .agg(ProductName=("Product Name", lambda s: s.value_counts().index[0]),
                   Category=("Category", "first"),
                   SubCategory=("Sub-Category", "first"))
              .reset_index())
products.columns = ["ProductID", "ProductName", "Category", "SubCategory"]

# 3) Orders
orders = df[["Order ID", "Order Date", "Ship Date", "Ship Mode", "Customer ID",
             "Country", "City", "State", "Postal Code", "Region"]].drop_duplicates("Order ID")
orders.columns = ["OrderID", "OrderDate", "ShipDate", "ShipMode", "CustomerID",
                  "Country", "City", "State", "PostalCode", "Region"]

# 4) OrderDetails
details = df[["Row ID", "Order ID", "Product ID", "Sales"]]
details.columns = ["RowID", "OrderID", "ProductID", "Sales"]

for name, d in [("customers", customers), ("products", products),
                ("orders", orders), ("order_details", details)]:
    d.to_csv(os.path.join(out, name + ".csv"), index=False, encoding="utf-8")
    print(name, d.shape)