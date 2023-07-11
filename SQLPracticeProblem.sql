CREATE DATABASE CustomerDB;

CREATE TABLE Customer(
	Customer_Id INT IDENTITY(1,1) PRIMARY KEY,
	Customer_Name VARCHAR(25),
	PhoneNumber VARCHAR(15),
	Address VARCHAR(50)
	);

SELECT * FROM Customer;

INSERT INTO Customer(Customer_Name,PhoneNumber,Address)VALUES('Jack','9898989898','Bangalore');
INSERT INTO Customer VALUES('John','9895959529','Kolkata');
INSERT INTO Customer VALUES('Snow','9111111111','New Delhi');
INSERT INTO Customer VALUES('Joey','9696969696','Mumbai');
INSERT INTO Customer VALUES('Ross','9519519519','Pune');

ALTER TABLE Customer ADD Country VARCHAR(20),State VARCHAR(20),Pincode VARCHAR(20);

UPDATE Customer
SET Country ='India',
	State = 'Karnataka',
	Pincode = '560056'
WHERE Customer_Id = 1;

UPDATE Customer
SET Country ='India',
	State = 'WestBengal',
	Pincode = '650056'
WHERE Customer_Id = 2;

UPDATE Customer
SET Country ='India',
	State = 'UnionTerritory',
	Pincode = '560056'
WHERE Customer_Id = 3;

UPDATE Customer
SET Country = 'India',
	State = 'Maharashtra',
	Pincode = '100015'
WHERE Customer_Id = 4;

UPDATE Customer
SET Country ='India',
	State = 'Maharshtra',
	Pincode = '100102'
WHERE Customer_Id = 5;

ALTER TABLE Customer DROP COLUMN State;

ALTER TABLE Customer ADD Salary DECIMAL(10,2);

UPDATE Customer
SET Salary = 25000.00
WHERE Customer_Id = 1;

UPDATE Customer
SET Salary = 35000.00
WHERE Customer_Id = 2;

UPDATE Customer
SET Salary = 45000.00
WHERE Customer_Id = 3;

UPDATE Customer
SET Salary = 25000.00
WHERE Customer_Id = 4;

UPDATE Customer
SET Salary = 15000.00
WHERE Customer_Id = 5;

SELECT * FROM Customer;

SELECT Country,COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country;

SELECT MAX(Salary) as MaximumSalary
FROM Customer;

SELECT MIN(Salary) as MinimumSalary
FROM Customer;

SELECT SUM(Salary) as TotalSalary
FROM Customer;

SELECT AVG(Salary) as AverageSalary
FROM Customer;

CREATE TABLE Orders(
	OrderId INT IDENTITY(1,1) PRIMARY KEY,
	ProductName VARCHAR(50),
	Quantity VARCHAR(50),
	Rating INT,
	Customer_Id INT FOREIGN KEY REFERENCES Customer(Customer_Id)
	);

SELECT * FROM Orders;

INSERT INTO Orders(ProductName,Quantity,Rating,Customer_Id)
VALUES('Product A',3,4,3),
	  ('Product B',2,5,2),
	  ('Product C',1,4,1),
	  ('Product D',1,1,4),
	  ('Product E',5,5,5);

SELECT *
FROM Customer
JOIN Orders
ON Customer.Customer_Id = Orders.Customer_Id;

ALTER TABLE Orders ALTER COLUMN Quantity VARCHAR(100);