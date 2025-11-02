CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

select * from #Sales

SELECT c.saleID, c.CustomerName
FROM #Sales c
WHERE EXISTS (
    SELECT 1
    FROM #Sales o
    WHERE o.saleID = c.saleID
      AND o.SaleDate >= '2024-03-01'
      AND o.SaleDate < '2024-04-01'
);

select s.product  from #Sales s
where s.Quantity*Price=(select max(Quantity*Price)  from #Sales )


select max(Quantity*Price) as eng_qimmati from #Sales  
where  Quantity*Price<(select max(Quantity*Price) as eng_qimmati from #Sales)

select MONTH(saledate) as oy_raqami, sum(quantity)as umumiy_miqdor  from #Sales
group by MONTH(saledate)

SELECT s.customerName ,s.Product from #Sales s
where exists ( select o.customerName from #Sales o
where s.Product=o.Product and  s.CustomerName<>o.CustomerName)

create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')
select * from Fruits
select name ,
sum(case when fruit='apple' then 1 else 0 end) as apple,
sum(case when fruit='orange' then 1 else 0 end) as orange,
sum(case when fruit='banana' then 1 else 0 end) as banana
from fruits
group by name

create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)

select * from Family

;with relations as(

select parentId, childId from Family
union all
select f.parentId, r.childId from family f
join Relations r on f.childId=r.ParentId
) 
SELECT DISTINCT ParentId AS OlderPerson, ChildID AS YoungerPerson
FROM Relations
ORDER BY ParentId, ChildID;


CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

select * from #Orders
select o.customerID , o.orderID, o.deliverystate
from #Orders o
join #orders t on o.CustomerID=t.CustomerID
where t.DeliveryState='ca' and
o.DeliveryState='tx'


drop table #residents
create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22'),
('xudaybergan', 'city=Tashkent country=Uzbekistan age=20')

select * from #residents

CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

select * from #Routes
--10 ishlanmadi


















CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')
select * from #RankingPuzzle

SELECT 
    ID,
    Vals,
    SUM(CASE WHEN Vals = 'Product' THEN 1 ELSE 0 END) 
        OVER (ORDER BY ID ROWS UNBOUNDED PRECEDING) AS ProductRank
FROM #RankingPuzzle;


CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

select * from #EmployeeSales

select e.EmployeeID, e.employeename, e.department , e.salesAmount  from #EmployeeSales e
where SalesAmount>(select avg(SalesAmount) as orta from #EmployeeSales where Department=e.Department)


select e.EmployeeID, e.employeeName, e.salesAmount,e.salesmonth from #EmployeeSales e
where not exists (select 1 from #employeeSales where e.SalesMonth=SalesMonth and salesamount>e.salesAmount )

---14




CREATE TABLE Products1 (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products1(ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

select * from Products1

select productID, name, category ,price  from Products1 
where price>(select avg(Price) as orta from Products1 )

select name , Category, stock from Products1
where stock<(select max(stock) as yuqori_zaxira from Products1) 

select p.name from  Products1 p
where p.Category=(select Category from Products1 where name='laptop' )

select p.name , p.price from Products1 p
where p.Price>(select min(price) from Products1  where  Category='electronics')

select * from Products1

select p.name, p.price from Products1 p
where p.Price>(select avg(price) from Products1 where p.Category=Category)


drop table Orders

CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

select * from Orders
select * from Products1
select  productID, min(quantity) as eng_kami  from Orders group by ProductID
having min(Quantity)=1

select productID , quantity from Orders
where quantity>(select avg(quantity) from Orders)

select productID,  quantity from Orders 
where quantity=0  

 
select  max(quantity) as eng_kop   from orders
