-- Create new Database
CREATE DATABASE superstore;
USE superstore;

-- Creating database and then importing the dataset as table named orders into it with the help of Table Data Import Wizard


SET SQL_SAFE_UPDATES = 0;
-- Changing datatypes    
UPDATE orders
SET OrderDate = STR_TO_DATE(OrderDate, '%m/%d/%Y'),
    ShipDate  = STR_TO_DATE(ShipDate, '%m/%d/%Y');

-- SELECT ALL COLUMNS
SELECT * FROM orders;

-- Get only OrderID, OrderDate, and Sales
SELECT OrderID, OrderDate, Sales
FROM orders
LIMIT 10;

-- Find orders where profit is negative
SELECT OrderID, ProductName, Sales, Profit
FROM orders
WHERE Profit < 0;

-- Get top 10 highest sales orders
SELECT OrderID, Sales, Profit
FROM orders
ORDER BY Sales DESC
LIMIT 10;


-- Find total sales by region
SELECT Region, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region;

-- Average profit by category
SELECT Category, AVG(Profit) AS Avg_Profit
FROM orders
GROUP BY Category
ORDER BY Avg_Profit DESC;

-- Top 5 products with highest sales in "Technology" category
SELECT ProductName, SUM(Sales) AS Total_Sales
FROM orders
WHERE Category = 'Technology'
GROUP BY ProductName
ORDER BY Total_Sales DESC
LIMIT 10;

-- Find orders from the same city (but different customers)
SELECT a.City, a.CustomerID AS CustomerA, b.CustomerID AS CustomerB
FROM orders a
JOIN orders b
    ON a.City = b.City
   AND a.CustomerID <> b.CustomerID
LIMIT 10;