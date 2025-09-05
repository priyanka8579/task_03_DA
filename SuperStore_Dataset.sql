-- Create new Database
CREATE DATABASE superstore;
USE superstore;

-- Creating table and then importing the data into it with the help of Table Data Import Wizard
CREATE TABLE orders (
	Row_Id INT,
    OrderID VARCHAR(50),
    OrderDate VARCHAR(50),
    ShipDate VARCHAR(50),
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(50),
    CustomerName VarChar(50),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Region VARCHAR(50),
    ProductID VARCHAR(50),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales VARCHAR(50),
    Quantity VARCHAR(50),
    Discount VARCHAR(50),
    Profit VARCHAR(50)
);

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