
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

SELECT AVG(Price) as AvgPrice
FROM Products
WHERE Category='Electronics';

SELECT *
FROM Customers
WHERE City LIKE 'L%';

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';

SELECT *
FROM Customers
WHERE Country LIKE '%a';

SELECT  MAX(Price) AS highetsPrice
FROM Products;

SELECT ProductName, StockQuantity,
       CASE 
           WHEN StockQuantity < 30 THEN 'Low Stock'
           ELSE 'Sufficient'
       END AS StockStatus
FROM Products;

SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;


SELECT MIN(Quantity) AS MinQuantity,
       MAX(Quantity) AS MaxQuantity
FROM Orders;

select * from Orders
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE o.OrderDate >= '2023-01-01' AND o.OrderDate < '2023-02-01'
AND o.CustomerID NOT IN (
    SELECT DISTINCT i.CustomerID
    FROM Invoices i
    WHERE i.InvoiceDate >= '2023-01-01' AND i.InvoiceDate < '2023-02-01'
);

SELECT DISTINCT o.customer_id
FROM Orders o
WHERE o.order_date >= '2023-01-01' AND o.order_date < '2023-02-01'
  AND o.customer_id NOT IN (
      SELECT DISTINCT i.customer_id
      FROM Invoices i
      WHERE i.invoice_date >= '2023-01-01' AND i.invoice_date < '2023-02-01'
  );
  

  SELECT productname FROM Products
UNION ALL
SELECT productname FROM Products_Discounted;

SELECT productname FROM Products
UNION
SELECT productname FROM Products_Discounted;


SELECT 
    YEAR(OrderDate) AS BuyurtmaYili,
    AVG(TotalAmount) AS OrtachaBuyurtmaSummasi
FROM 
    Orders
GROUP BY 
    YEAR(OrderDate)
ORDER BY 
    BuyurtmaYili;


SELECT 
    productname,
    CASE 
        WHEN price < 100 THEN 'Low'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid'
        ELSE 'High'
    END AS pricegroup
FROM Products;

SELECT *
INTO Population_Each_Year
FROM (
    SELECT 
        district_name,
        Year,
        Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;


select productID,
sum(SaleAmount) as totol_Amount 
from Sales
Group by ProductID


SELECT ProductName
FROM Products
where ProductName like '%oo%';

SELECT *
INTO Population_each_City
From(
     select
	 year,
	 District_name,
	 population
	 from city_population
	 ) as SourceTable
	 Pivot(
	 Sum(population)
	  FOR District_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;

SELECT Top 3
    CustomerID,
    SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


SELECT 
    district_name,
    [2012] AS Population,
    2012 AS Year
FROM Population_Each_Year
UNION ALL
SELECT 
    district_name,
    [2013],
    2013
FROM Population_Each_Year;

SELECT 
    p.productname,
    COUNT(s.saleid) AS times_sold
FROM Products p
JOIN Sales s ON p.productid = s.productid
GROUP BY p.productname

SELECT 
    Year,
    'Bektemir' AS City,
    Bektemir AS Population
FROM Population_Each_City
UNION ALL
SELECT 
    Year,
    'Chilonzor',
    Chilonzor
FROM Population_Each_City
UNION ALL
SELECT 
    Year,
    'Yakkasaroy',
    Yakkasaroy
FROM Population_Each_City;
