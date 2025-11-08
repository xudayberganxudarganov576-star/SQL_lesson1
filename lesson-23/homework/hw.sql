CREATE TABLE Dates (
    Id INT,
    Dt DATETIME
);
INSERT INTO Dates VALUES
(1,'2018-04-06 11:06:43.020'),
(2,'2017-12-06 11:06:43.020'),
(3,'2016-01-06 11:06:43.020'),
(4,'2015-11-06 11:06:43.020'),
(5,'2014-10-06 11:06:43.020');

select * from Dates

select 
RIGHT('0' + cast(month(dt) as varchar(2)), 2) as month
from Dates

CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);

select * from MyTabel

;with maxperpair as (
select id, rid, max(vals) as maxval
from MyTabel
group by Id, rid)
select
   count(distinct id) as distinct_ids,
   Rid,
   SUM(maxVal) as totalMaxVals
   from maxperpair
   group by rID
   order by rID

   CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');

 
select * from TestFixLengths
where LEN(vals) is not null
and LEN(vals) between 6 and 10



CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);

select * from testmaximum

select 
t.ID, t.item, t.vals from TestMaximum t
where t.Vals =(select MAX(vals) from TestMaximum
where id = t.ID)
order by t.ID


CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);


select * from SumOfMax

;with cte as (
select 
detailedNumber,
id,
MAX(vals) as maxVal
from SumOfMax
group by DetailedNumber, Id)
select id, SUM(maxval) as sumofmaxvals
from cte
group by id
order by id

CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);

select * from TheZeroPuzzle

select 
 a,
 b,
 case when a - b = 0 then ' ' 
 else CAST(a - b as varchar)
 end as differencee
 from TheZeroPuzzle

 select * from TheZeroPuzzle

 CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Sales (Product, Category, QuantitySold, UnitPrice, SaleDate, Region, CustomerID)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North', 1),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North', 2),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East', 3),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West', 4),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South', 5),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South', 6),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East', 7),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North', 8),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West', 9),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East', 10),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South', 1),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North', 2),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West', 3),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South', 4),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East', 5),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North', 6),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South', 7),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East', 8),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West', 9),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North', 10);
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);

INSERT INTO Customers (CustomerName, Region, JoinDate)
VALUES
('John Doe', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');

select SUM(unitPrice) as total_revanue
from Sales

select * from Sales

select product, unitprice, 
AVG(unitPrice) as avgprice
from Sales group by Product, UnitPrice

select product,
 quantitysold,
 SUM(quantitysold) as sale_transaction
 from Sales
 group by Product,
 QuantitySold

 select SUM(quantitysold) from Sales

 SELECT product, quantitysold
FROM Sales
WHERE quantitysold = (SELECT MAX(quantitysold) FROM Sales);

select category,
SUM(quantitysold) as total_sold
from Sales
group by Category

select category, region,
SUM(quantitysold * UnitPrice) as total_revenue
from Sales
group by Category, Region

select * from Sales

select PRODUCT,
quantitysold,
unitprice,
max (quantitysold * unitPrice) as max_sold from sales 
group by PRODUCT,quantitysold, unitprice

select PRODUCT,
quantitysold, unitprice,
saledate,
sum (quantitysold * unitPrice) over ( order by saledate) as absd
from sales
order by saledate

select Category,
sum (quantitysold * unitPrice) 
from sales
 group by Category

 select * from Customers
 select * from Sales


 select c.customerName, s.product, s.quantitySold 
 from Customers c
 join Sales s
 on c.CustomerID = s.CustomerID
 
 
 select c.customerName, s.product, s.quantitySold 
 from Customers c
 left join Sales s
 on c.CustomerID = s.CustomerID
 where s.CustomerID is null

 
 select c.customerName,  
 sum(quantitysold * unitPrice) as total_revanue 
 from Customers c
 join Sales s
 on c.CustomerID = s.CustomerID
group by c.CustomerName

select top 1 c.customerName,  
 sum(quantitysold * unitPrice) as total_revanue 
 from Customers c
 join Sales s
 on c.CustomerID = s.CustomerID
group by c.CustomerName
order by total_revanue DESC;



 select c.customerName, 
 SUM(quantitySold * unitPrice)
 from Customers c
 join Sales s
 on c.CustomerID = s.CustomerID
 group by c.CustomerName
 
 CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);

select * from Products
select * from Sales

select distinct p.productName from Products p
join sales s
on p.ProductID = s.SaleID

select top 1 productName, 
MAX(costprice) as expensive_price
from Products
group by ProductName

select 
ProductName,Category,
SellingPrice from products p 
where SellingPrice>(
select AVG(sellingPrice) as avg_sales from Products
where category = p.category) ;











































