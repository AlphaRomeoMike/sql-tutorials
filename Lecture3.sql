DROP TABLE dabeer, Users;


-- CREATE A USERS TABLE
CREATE TABLE Users (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(255) NOT NULL,
	Phone INT UNIQUE NOT NULL,
	Description TEXT NULL
);


-- SELECT ALL FROM USERS TABLE
SELECT * FROM Users


-- INSERT MULTIPLE TUPLES WITH A SINGLE QUERY 
INSERT INTO Users 
	VALUES 
('John Doe', 090078603, 'This is user John Doe'),
('Peter Parker', 090078605, 'This is user Peter Parker')


-- ALIAS
SELECT 
	Name AS Username,
	Phone AS Contact,
	Description AS Profile
FROM Users;


-- DELETE DATA FROM USERS TABLE
-- (NEVER EVER RUN THIS QUERY IN PRODUCTION)
DELETE FROM Users;

-- UPDATE DATA FROM USERS TABLE
UPDATE Users SET 
	Name = 'William',
	Phone = 030090000,
	Description = 'This is user William'
WHERE Id = 12