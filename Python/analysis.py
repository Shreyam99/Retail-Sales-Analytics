import pandas as pd
import matplotlib.pyplot as plt
import mysql.connector
import os

# -----------------------------
# MySQL Connection
# -----------------------------
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root12345",      # Agar password hai to yahan likhna
    database="retail_sales_db"
)

query = "SELECT * FROM sales_data;"
df = pd.read_sql(query, conn)

conn.close()

print("Dataset Loaded Successfully")
print(df.head())

# -----------------------------
# Create Output Folder
# -----------------------------
os.makedirs("Outputs", exist_ok=True)

# -----------------------------
# Convert Sales & Profit Columns
# -----------------------------
df["Sales"] = pd.to_numeric(df["Sales"])
df["Profit"] = pd.to_numeric(df["Profit"])

# -----------------------------
# 1. Top 10 States by Sales
# -----------------------------
top_states = df.groupby("State")["Sales"].sum().sort_values(ascending=False).head(10)

plt.figure(figsize=(10,6))
top_states.plot(kind="bar")
plt.title("Top 10 States by Sales")
plt.ylabel("Sales")
plt.tight_layout()
plt.savefig("Outputs/top_states_sales.png")
plt.close()

# -----------------------------
# 2. Category Wise Sales
# -----------------------------
category_sales = df.groupby("Category")["Sales"].sum()

plt.figure(figsize=(6,6))
category_sales.plot(kind="pie", autopct="%1.1f%%")
plt.ylabel("")
plt.title("Category Wise Sales")
plt.tight_layout()
plt.savefig("Outputs/category_sales.png")
plt.close()

# -----------------------------
# 3. Region Wise Profit
# -----------------------------
region_profit = df.groupby("Region")["Profit"].sum()

plt.figure(figsize=(8,5))
region_profit.plot(kind="bar")
plt.title("Region Wise Profit")
plt.ylabel("Profit")
plt.tight_layout()
plt.savefig("Outputs/region_profit.png")
plt.close()

# -----------------------------
# 4. Segment Wise Sales
# -----------------------------
segment_sales = df.groupby("Segment")["Sales"].sum()

plt.figure(figsize=(8,5))
segment_sales.plot(kind="bar")
plt.title("Segment Wise Sales")
plt.ylabel("Sales")
plt.tight_layout()
plt.savefig("Outputs/segment_sales.png")
plt.close()

# -----------------------------
# 5. Top 10 Products
# -----------------------------
top_products = df.groupby("Product Name")["Sales"].sum().sort_values(ascending=False).head(10)

plt.figure(figsize=(14,7))
top_products.plot(kind="barh")   # Horizontal bar chart
plt.title("Top 10 Products by Sales")
plt.xlabel("Sales")
plt.ylabel("Product")
plt.tight_layout()
plt.savefig("Outputs/top_products.png", dpi=300)
plt.close()

print("\nAnalysis Completed Successfully!")
print("Graphs saved inside Outputs folder.")