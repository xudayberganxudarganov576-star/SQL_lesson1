---Definition:
--BULK INSERT is a Transact-SQL (T-SQL) statement that imports data from a text file (such as CSV, TXT, or other delimited files) into a SQL Server table in bulk, rather than inserting row by row.

--Here are four common file formats that can be imported into SQL Server:
--CSV (Comma-Separated Values)
--TXT (Text files, often tab-delimited or other delimiters)
--Excel files (.xls, .xlsx)
--XML (Extensible Markup Language)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);


INSERT INTO Products (ProductID, ProductName, Price) 
VALUES 
(1, 'Laptop', 799.99),
(2, 'Smartphone', 599.49),
(3, 'Tablet', 299.99);


--NULL: Bu qiymatning mavjud emasligini yoki noma'lumligini bildiradi. Masalan, agar mahsulotning narxini bilmasangiz, Price ustunida NULL qiymatini qo'yishingiz mumkin.

--NOT NULL: Bu ustunda NULL qiymati bo'lishi mumkin emasligini bildiradi. Masalan, ProductID va ProductName odatda NOT NULL bo'ladi, chunki har bir mahsulotda yagona ID va nom bo'lishi kerak.

ALTER TABLE Products 
ADD CONSTRAINT UniqueProductName UNIQUE (ProductName);

-- This query adds a UNIQUE constraint to the ProductName column
ALTER TABLE Products 
ADD CONSTRAINT UniqueProductName UNIQUE (ProductName);

ALTER TABLE Products 
ADD CategoryID INT;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE
);
--IDENTITY SQL Server’da avtomatik ravishda har bir yangi satr uchun noyob raqamni yaratish uchun ishlatiladi. Bu ko'pincha asosiy kalitlar uchun ishlatiladi.

BULK INSERT Products
FROM 'C:\Users\user\Desktop\text.txt'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',  
    FIRSTROW = 2         
);

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID);

--PRIMARY KEY yagona bo'lishi va NULL bo'lishi mumkin emas.

--UNIQUE KEY bir nechta bo'lishi mumkin va NULL bo'lishi mumkin.

ALTER TABLE Products
ADD CONSTRAINT chk_Price_Positive CHECK (Price > 0);

ALTER TABLE Products
ADD Stock INT NOT NULL;

SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

Maqsadi:

--FOREIGN KEY bir jadvaldagi (bolalar jadvali) ustunni boshqa jadvaldagi (ota jadvali) ustun bilan bog'laydi.

--Bu cheklov bolalar jadvalidagi qiymatlar ota jadvalidagi mos qiymatlarga mos kelishini ta'minlaydi.

--Bu, bolalar jadvalidagi "orphan" (yolg'iz) yozuvlarning oldini olishga yordam beradi.

--Ishlatilishi:

--FOREIGN KEY cheklovi bolalar jadvalidagi ustunda (masalan, Products.CategoryID) yaratiladi va ota jadvalidagi ustunga (masalan, Categories.CategoryID) bog'lanadi.

--Bu cheklov, agar ota jadvalidagi qiymat yo'q bo'lsa, bolalar jadvalida mos yozuvlar kiritilishiga yo'l qo'ymaydi.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT,
    CONSTRAINT chk_Age CHECK (Age >= 18)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(100, 10) PRIMARY KEY,  
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)  
);
--COALESCE funksiyasi bir nechta qiymatlar orasidan birinchi NULL bo'lmagan qiymatni qaytaradi.

--Masalan:

--SELECT COALESCE(NULL, NULL, 'Birinci NoNull Qiymat', 'Ikkinchi Qiymat') AS

--ISNULL funksiyasi faqat ikkita argumentni qabul qiladi: birinchi argument NULL bo'lsa, uni ikkinchi argument bilan almashtiradi.

--Masalan:

--SELECT ISNULL(Price, 0) AS Price
--FROM Products;

--Farqi:

--COALESCE bir nechta qiymatlar orasidan birinchi NULL bo'lmagan qiymatni qaytaradi, ISNULL esa faqat ikkita qiymatni tekshiradi va birinchi NULL bo'lsa, uni almashtiradi.

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,  
    EmpName VARCHAR(100),
    Email VARCHAR(100) UNIQUE  
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    CONSTRAINT FK_Orders_Customers
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
    ON DELETE CASCADE  -- Agar `Customers` jadvalidan mijoz o'chirilsa, `Orders` jadvalidagi tegishli yozuvlar ham o'chadi
    ON UPDATE CASCADE  -- Agar `Customers` jadvalidagi `CustomerID` yangilansa, `Orders` jadvalidagi tegishli yozuvlar ham yangilanadi
);
