-- Querry to create the SalesData table in the Azure SQL Database used to map the csv data set. Output in Step 8 in the report
CREATE TABLE SalesData (
    ShipMode NVARCHAR(50),
    Segment NVARCHAR(50),
    Country NVARCHAR(50),
    City NVARCHAR(50),
    State NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Region NVARCHAR(50),
    Category NVARCHAR(50),
    SubCategory NVARCHAR(50),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT
);

-- Verify that the table was created. Output in Step 9 in the report
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SalesData';

-- Verify that teh SQL table contains the data from the csv file. Output in Step 13 in the report
SELECT * FROM [dbo].[SalesData]

-- State Sales Table 
CREATE TABLE StateSales (
    StateID INT IDENTITY PRIMARY KEY,  -- Unique ID for each region
    State NVARCHAR(50) UNIQUE,         -- Region name (ensures no duplicates)
    TotalStateSales DECIMAL(18,2) DEFAULT 0  -- Stores total sales for each region
);

INSERT INTO StateSales (State, TotalStateSales)
SELECT 
    s.State, 
    SUM(s.Sales) AS TotalStateSales
FROM SalesData s
GROUP BY s.State;


-- Consumer Sales Pie Table 
CREATE TABLE dbo.consumersalespie ( 
    Id INT NOT NULL PRIMARY KEY, 
    Category VARCHAR(255) NULL, 
    TotalSales INT NOT NULL 
);

INSERT INTO dbo.consumersalespie (Category, TotalSales) 
SELECT Category, SUM(Sales) AS TotalSales 
FROM dbo.SalesData 
GROUP BY Category; 

-- Consumer Customer Count Table 
CREATE TABLE ConsumerCustomerCount ( 
    Region VARCHAR(255) NULL, 
    State VARCHAR(255) NULL, 
    Customer_Count INT NULL 
);

INSERT INTO dbo.ConsumerCustomerCount (Region, State, Customer_Count) 
SELECT Region, State, COUNT(*) AS Customer_Count 
FROM dbo.SalesData 
WHERE Segment = 'Consumer' 
GROUP BY Region, State; 

-- Customer Segment Profitability Table
CREATE TABLE CustomerSegmentProfitability ( 
    id INT NOT NULL PRIMARY KEY, 
    segment VARCHAR(255) NULL, 
    sales DECIMAL(18,2) NULL, 
    profit DECIMAL(18,2) NULL 
); 

INSERT INTO dbo.CustomerSegmentProfitability (segment, sales, profit) 
SELECT Segment, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit 
FROM dbo.SalesData 
WHERE Segment = 'Consumer' 
GROUP BY Segment; 

