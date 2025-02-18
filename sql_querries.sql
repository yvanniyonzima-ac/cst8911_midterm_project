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