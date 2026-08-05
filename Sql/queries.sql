USE retail_sales_db;

-- 1. View complete dataset
SELECT * FROM sales_data;

-- 2. Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM sales_data;

-- 3. Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM sales_data;

-- 4. Total Orders
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM sales_data;

-- 5. Sales by Region
SELECT Region,
ROUND(SUM(Sales),2) AS Sales
FROM sales_data
GROUP BY Region
ORDER BY Sales DESC;

-- 6. Profit by Region
SELECT Region,
ROUND(SUM(Profit),2) AS Profit
FROM sales_data
GROUP BY Region
ORDER BY Profit DESC;

-- 7. Top 10 States by Sales
SELECT State,
ROUND(SUM(Sales),2) AS Sales
FROM sales_data
GROUP BY State
ORDER BY Sales DESC
LIMIT 10;

-- 8. Top 10 Cities by Profit
SELECT City,
ROUND(SUM(Profit),2) AS Profit
FROM sales_data
GROUP BY City
ORDER BY Profit DESC
LIMIT 10;

-- 9. Category Performance
SELECT Category,
ROUND(SUM(Sales),2) AS Sales,
ROUND(SUM(Profit),2) AS Profit
FROM sales_data
GROUP BY Category;

-- 10. Sub Category Performance
SELECT `Sub-Category`,
ROUND(SUM(Sales),2) AS Sales,
ROUND(SUM(Profit),2) AS Profit
FROM sales_data
GROUP BY `Sub-Category`
ORDER BY Sales DESC;

-- 11. Segment Wise Sales
SELECT Segment,
ROUND(SUM(Sales),2) AS Sales
FROM sales_data
GROUP BY Segment;

-- 12. Average Discount
SELECT ROUND(AVG(Discount),2) AS Avg_Discount
FROM sales_data;

-- 13. Highest Selling Products
SELECT `Product Name`,
ROUND(SUM(Sales),2) AS Sales
FROM sales_data
GROUP BY `Product Name`
ORDER BY Sales DESC
LIMIT 10;

-- 14. Most Profitable Products
SELECT `Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM sales_data
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

-- 15. Loss Making Products
SELECT `Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM sales_data
GROUP BY `Product Name`
HAVING Profit < 0
ORDER BY Profit;

-- 16. Ship Mode Analysis
SELECT `Ship Mode`,
ROUND(SUM(Sales),2) AS Sales
FROM sales_data
GROUP BY `Ship Mode`;

-- 17. Average Sales Per Order
SELECT ROUND(AVG(Sales),2) AS Avg_Sales
FROM sales_data;

-- 18. Top Customers
SELECT `Customer Name`,
ROUND(SUM(Sales),2) AS Sales
FROM sales_data
GROUP BY `Customer Name`
ORDER BY Sales DESC
LIMIT 10;

-- 19. Monthly Sales Trend
SELECT
MONTH(STR_TO_DATE(`Order Date`,'%d-%m-%Y')) AS Month,
ROUND(SUM(Sales),2) AS Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;

-- 20. Overall Business KPIs
SELECT
COUNT(*) AS Total_Transactions,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit,
ROUND(AVG(Discount),2) AS Avg_Discount;