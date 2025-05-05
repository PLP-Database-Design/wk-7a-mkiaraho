-- question 1
create database store;
USE STORE;
CREATE TABLE ProductDetailS (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products JSON
);

INSERT INTO ProductDetailS (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', '["Laptop","Mouse"]'),
(102, 'Jane Smith', '["Tablet","Keyboard","Mouse"]'),
(103, 'Emily Clark', '["Phone"]');
SELECT 
    OrderID,
    CustomerName,
    Product
FROM 
    ProductDetailS,
    JSON_TABLE(
        Products,
        '$[*]' COLUMNS (Product VARCHAR(100) PATH '$')
    ) AS jt;
-- question 2
USE store;
/*
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);
INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;*/
CREATE TABLE orderDetails(
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);
INSERT INTO orderDetails(OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
