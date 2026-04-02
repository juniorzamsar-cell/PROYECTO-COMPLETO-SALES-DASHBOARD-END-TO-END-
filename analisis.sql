🔧 SQL — Null Check
SELECT 
    COUNT(*) - COUNT(Sales) AS null_sales,
    COUNT(*) - COUNT(Profit) AS null_profit,
    COUNT(*) - COUNT(Discount) AS null_discount
FROM superstore;

🔧 SQL — Duplicates Check
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Order_ID) AS unique_orders
FROM superstore;

🔧 SQL — Negative Values
SELECT *
FROM superstore
WHERE Sales < 0 OR Profit < 0;

🔧 SQL — Date Range
SELECT 
    MIN(Order_Date) AS min_date,
    MAX(Order_Date) AS max_date
FROM superstore;

🔧 SQL — Outliers
SELECT 
    MIN(Sales) AS min_sales,
    MAX(Sales) AS max_sales,
    MIN(Profit) AS min_profit,
    MAX(Profit) AS max_profit
FROM superstore;

KPIs
SELECT 
    SUM(Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS profit_margin
FROM superstore;

Regional Performance
SELECT 
    Region,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS margin
FROM superstore
GROUP BY Region
ORDER BY profit DESC;

Product Performance
SELECT 
    Category,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS margin
FROM superstore
GROUP BY Category;
Discount vs Profit (Basic)
SELECT 
    Discount,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

Discount vs Profit by Category
SELECT 
    Category,
    Discount,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS margin
FROM superstore
GROUP BY Category, Discount
ORDER BY Category, Discount;

Loss Detection
SELECT 
    Category,
    Discount,
    SUM(Profit) AS profit
FROM superstore
GROUP BY Category, Discount
HAVING SUM(Profit) < 0
ORDER BY Category, Discount;

Worst Cases
SELECT 
    Category,
    Discount,
    SUM(Profit) AS profit
FROM superstore
GROUP BY Category, Discount
ORDER BY profit ASC
LIMIT 10;

-- KPIs
SELECT 
    SUM(Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS profit_margin
FROM superstore;

-- Regional
SELECT 
    Region,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit
FROM superstore
GROUP BY Region;

-- Category
SELECT 
    Category,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit
FROM superstore
GROUP BY Category;

-- Discount impact
SELECT 
    Category,
    Discount,
    SUM(Profit) AS profit
FROM superstore
GROUP BY Category, Discount;
