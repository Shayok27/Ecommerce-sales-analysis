CREATE DATABASE Ecommerce;
USE Ecommerce;

-- Product revenue and highest revenue

SELECT Product_Category,
       sum(Order_Amount) AS Total_Revenue
FROM ecommerce_orders
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;

-- Total unit sales most

SELECT Product_Category,
       SUM(Quantity) AS Total_Units_Sold
FROM ecommerce_orders
GROUP BY Product_Category
ORDER BY Total_Units_Sold DESC;

-- Most Profit
SELECT Product_Category,
       SUM(CAST(REPLACE(Profit_Amount, '$', '') AS DECIMAL(10,2))) AS Most_Profit
FROM ecommerce_orders
GROUP BY Product_Category
ORDER BY Most_Profit DESC;

-- Top 10 customer purchase

SELECT Customer_ID,
       SUM(Order_Amount) AS Total_Spending
FROM ecommerce_orders
GROUP BY Customer_ID
ORDER BY Total_Spending DESC
limit 10;

-- Frequntly ordered

SELECT Customer_ID,
       count(Order_ID) AS Total_Order
FROM ecommerce_orders
GROUP BY Customer_ID
ORDER BY Total_Order DESC
limit 10;

-- Repeated customers

SELECT Customer_ID,
       count(Order_ID) AS Total_Order
FROM ecommerce_orders
GROUP BY Customer_ID
having count(Order_ID)>1
ORDER BY Total_Order DESC;

-- Average revenue per Customer
SELECT CAST(SUM(Order_Amount) / COUNT(DISTINCT Customer_ID) AS DECIMAL(10,2)) AS Avg_Revenue_Per_Customer 
FROM ecommerce_orders;

-- Highest payment revenue
SELECT Payment_Method,
       Cast(SUM(Order_Amount) As Decimal(10, 2)) AS Total_Revenue
FROM ecommerce_orders
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;

-- Traffic source revenue

SELECT Traffic_Source,
       Cast(SUM(Order_Amount) As Decimal(10, 2)) AS Total_Revenue
FROM ecommerce_orders
GROUP BY Traffic_Source
ORDER BY Total_Revenue DESC;

-- Country revenue

SELECT Country,
       Cast(SUM(Order_Amount) As Decimal(10, 2)) AS Total_Revenue
FROM ecommerce_orders
GROUP BY Country,
ORDER BY Total_Revenue DESC;


-- City revenue

SELECT City,
       Cast(SUM(Order_Amount) As Decimal(10, 2)) AS Total_Revenue
FROM ecommerce_orders
GROUP BY City
ORDER BY Total_Revenue DESC;

-- Customer life time value

SELECT Customer_ID,
       Cast(SUM(Order_Amount) As Decimal(10, 2)) AS Total_Revenue
FROM ecommerce_orders
GROUP BY Customer_ID
ORDER BY Total_Revenue DESC;

-- Avg deleivery time

SELECT ROUND(AVG(Delivery_Days), 2) AS Avg_Delivery_Days
FROM ecommerce_orders
where Order_Status = "Delivered";

-- Return rate

SELECT Product_Category,
       Round(COUNT(CASE WHEN Order_Status = 'Returned' THEN 1 END) * 100.0 / COUNT(*), 2) Return_Rate
FROM ecommerce_orders
GROUP BY Product_Category
ORDER BY Return_Rate DESC;


