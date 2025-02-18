-- Querry to create the SalesData table in the Azure SQL Database used to map the csv data set
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
