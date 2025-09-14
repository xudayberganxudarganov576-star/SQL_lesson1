create table employees(EmpID int Name varchar(50), salary decimal(10, 2));

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alice Johnson', 6500.00);


INSERT INTO Employees (EmpID, Name, Salary)
VALUES (2, 'Bob Smith', 7200.50);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (3, 'Charlie Lee', 8100.00);


   UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

DELETE FROM Employees
WHERE EmpID = 2;

ALTER TABLE Employees
MODIFY Name VARCHAR(100);

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

ALTER TABLE Employees
ADD Department VARCHAR(50);

ALTER TABLE Employees
MODIFY Salary FLOAT;

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

TRUNCATE TABLE Employees;

DELETE FROM Emp



insert into Departments(DepartmentName)
select 'Finance'
union
select 'HR'
union
SELECT 'Engineering'
UNION
SELECT 'Marketing'
UNION
SELECT 'Sales';


UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

DELETE FROM Employees;

TRUNCATE TABLE Employees;

ALTER TABLE Employees
DROP COLUMN Department;

ALTER TABLE Employees
RENAME TO StaffMembers;

EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

ALTER TABLE Products
ADD CONSTRAINT chk_Price_Positive CHECK (Price > 0);

ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES
(1, 'Olma', 'Meva', 2.50, 100),
(2, 'Noutbuk', 'Elektronika', 950.00, 20),
(3, 'Stol', 'Mebel', 150.00, 10),
(4, 'Shampun', 'Gigiyena', 5.00, 80),
(5, 'Qalam', 'Kanselyariya', 0.50, 500);


SELECT * INTO Products_Backup
FROM Products;


EXEC sp_rename 'Products', 'Inventory';

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000, 5) PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price FLOAT,
    StockQuantity INT
);


INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, StockQuantity
FROM Inventory;

DROP TABLE Inventory;

EXEC sp_rename 'Inventory_New', 'Inventory';


