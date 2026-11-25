-- 5. Inventory Management System
-- Problem Statement:
-- A retail store wants to track available products, stock quantity, suppliers, and purchase prices.
-- Concepts Covered:
-- •	Constraints
-- •	Basic Reports
-- •	Stock Calculation

CREATE DATABASE InventoryDB;
USE InventoryDB;

CREATE TABLE Suppliers
(
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(50) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE
);

INSERT INTO Suppliers
VALUES
(1, 'ABC Traders', '9876543210'),
(2, 'Maya Enterprises', '9876543211'),
(3, 'Global Suppliers', '9876543212'),
(4, 'Smart Distributors', '9876543213');

select * from Suppliers;

CREATE TABLE Products
(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Supplier_ID INT,
    Stock_Qty INT DEFAULT 0,
    Purchase_Price DECIMAL(10,2) CHECK (Purchase_Price > 0),

    FOREIGN KEY (Supplier_ID)
    REFERENCES Suppliers(Supplier_ID)
);


INSERT INTO Products
VALUES
(101, 'Laptop', 1, 20, 55000.00),
(102, 'Keyboard', 2, 50, 800.00),
(103, 'Mouse', 2, 75, 500.00),
(104, 'Monitor', 3, 15, 12000.00),
(105, 'Printer', 4, 10, 15000.00),
(106, 'Webcam', 1, 25, 2500.00),
(107, 'Headphones', 3, 40, 1800.00),
(108, 'USB Cable', 4, 100, 250.00);

select * from products;

ALTER TABLE Products
ADD CONSTRAINT chk_stock
CHECK (Stock_Qty >= 0);

ALTER TABLE Products
MODIFY Supplier_ID INT NOT NULL;