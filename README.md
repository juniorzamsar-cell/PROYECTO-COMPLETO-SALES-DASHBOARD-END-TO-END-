# PROYECTO-COMPLETO-SALES-DASHBOARD-END-TO-END-
Sales &amp; Profitability Analysis — Superstore (SQL + Power BI)
Business Context

This project simulates a real-world business scenario where a retail company needs to understand:

Where revenue is generated
Which segments are profitable
Where the company is losing money
The impact of discounts on profitability
🎯 Objectives
Validate and understand the dataset
Analyze revenue and profit performance
Identify key business problems
Build a Power BI dashboard for decision-making
🧹 Phase 1 — Data Audit
📌 Objective

Ensure data quality before analysis.

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
💣 Conclusion
No critical data quality issues detected
Negative profit values represent real business losses
Dataset is reliable for analysis
📊 Phase 2 — Core Business Analysis
💰 KPIs
SELECT 
    SUM(Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS profit_margin
FROM superstore;
Insight

The business generates strong revenue but operates with a relatively tight margin (~11%), making it sensitive to pricing strategies and discounts.

🌍 Regional Performance
SELECT 
    Region,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS margin
FROM superstore
GROUP BY Region
ORDER BY profit DESC;
Insight
West leads in revenue
South leads in profitability

👉 High sales do not guarantee high profit.

📦 Product Performance
SELECT 
    Category,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS margin
FROM superstore
GROUP BY Category;
Insight
Furniture generates highest revenue
Technology generates highest profit
Furniture shows very low margin (~2–3%)

👉 High volume does not equal profitability.

💣 Phase 3 — Profitability Analysis (Key Insight)
🔧 Discount vs Profit (Basic)
SELECT 
    Discount,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;
🔧 Discount vs Profit by Category
SELECT 
    Category,
    Discount,
    SUM(Sales) AS revenue,
    SUM(Profit) AS profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS margin
FROM superstore
GROUP BY Category, Discount
ORDER BY Category, Discount;
🔧 Loss Detection
SELECT 
    Category,
    Discount,
    SUM(Profit) AS profit
FROM superstore
GROUP BY Category, Discount
HAVING SUM(Profit) < 0
ORDER BY Category, Discount;
🔧 Worst Cases
SELECT 
    Category,
    Discount,
    SUM(Profit) AS profit
FROM superstore
GROUP BY Category, Discount
ORDER BY profit ASC
LIMIT 10;
💣 Key Finding

Discounts above 30–40% significantly reduce profitability.

Furniture becomes unprofitable at ~30% discount
Severe losses occur at 50–70%
🚀 Business Insights
High revenue does not guarantee profitability
Furniture category is structurally unprofitable at high discounts
Technology is the most profitable category
Discounts are the main driver of losses
📈 Business Recommendations
🎯 Pricing Strategy
Limit discounts (especially above 30%)
Implement category-specific pricing
📦 Product Strategy
Focus on Technology and Office Supplies
Reevaluate Furniture pricing and cost structure
🌍 Regional Strategy
Optimize West region margins
Benchmark South region performance
📊 Power BI Dashboard
Pages Included
Overview (KPIs + trends)
Regional Analysis
Product Performance
Profitability Analysis
🛠️ Tools Used
SQL (analysis)
Power BI (visualization)
Excel (data source)
💣 Final Takeaway

This project shows how aggressive discount strategies can destroy profitability, even when sales are high.

👉 Data-driven pricing decisions are critical for sustainable growth.
