CREATE DATABASE Lec5;

USE Lec5;


CREATE TABLE Customers(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Contact INT NOT NULL,
	Country NVARCHAR(50) NOT NULL
);

CREATE TABLE Orders(
	Id INT PRIMARY KEY IDENTITY(50, 1) NOT NULL,
	CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customers(Id),
	Date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(100) UNIQUE NOT NULL,
	Price INT NOT NULL,
	Description TEXT NULL
);



INSERT INTO Customers VALUES 
('John Doe', 090078601, 'Pakistan'),
('Peter Parker', 0300123456, 'Turkey'),
('William Johnson', 034588888, 'Indonesia'),
('Tom Harry', 034588888, 'Indonesia');

INSERT INTO Products VALUES 
('Banana', 50, 'This is some banana'),
('Orange', 67, 'This is some orange'),
('Guvava', 42, 'This is some guvava'),
('Kiwi', 99, 'This is some kiwi');

INSERT INTO Orders (CustomerId) VALUES 
(1),
(2);

SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM Customers;



-- INNER JOIN ON CUSTOMERID
SELECT Orders.Id, 
Customers.Name AS 'Customer Name', 
Customers.Contact AS 'Customer Contact', 
Customers.Country AS 'Order Country', 
Orders.Date AS 'Ordered On'
FROM Orders
INNER JOIN Customers ON Customers.Id = Orders.CustomerId;




-- LEFT OUTER JOIN/LEFT JOIN
-- IT WILL RETURN ALL THE COLUMNS
-- WITH THE JOIN AND THOSE EVEN IF
-- THEY DONOT MATCH THE CRITERIA 
-- FROM THE LEFT TABLE

SELECT 
Customers.Name AS 'Customer Name',
Customers.Country AS 'Order Country',
Orders.Id AS 'Order Id'
FROM Customers
LEFT JOIN Orders ON Customers.Id = Orders.CustomerId;




-- RIGHT OUTER JOIN/RIGHT JOIN
-- IT WILL RETURN ALL THE COLUMNS
-- WITH THE JOIN AND THOSE EVEN IF
-- THEY DONOT MATCH THE CRITERIA 
-- FROM THE RIGHT TABLE

SELECT 
Customers.Name AS 'Customer Name',
Customers.Country AS 'Order Country',
Orders.Id AS 'Order Id'
FROM Customers
RIGHT JOIN Orders ON Customers.Id = Orders.CustomerId;



-- DISTINCT STATEMENT
SELECT DISTINCT Country FROM Customers


-- LOGICAL OPERTATORS 
SELECT DISTINCT Name, Country FROM Customers Where Country = 'Pakistan' OR Country = 'Turkey';



-- ORDER BY CLAUSE
SELECT * FROM Customers ORDER BY Id DESC;



-- MAX(), MIN() AND AVG()
SELECT 
Name, Description, Price
FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);

SELECT 
Name, Description, Price
FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);

SELECT AVG(Price) FROM Products
