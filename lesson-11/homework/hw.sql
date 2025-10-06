SELECT 
      o.orderID,
	  c.FirstName+'  '+LastName as CustomerName,
	  o.orderDate
FROM
      orders o
JOIN
      customers c 
ON 
      o.CustomerID=c.customerID
WHERE 
      YEAR(OrderDate)>2022

SELECT e.Name, d.departmentName
FROM Employees e
JOIN Departments d on e.DepartmentID=d.DepartmentID
WHERE d.DepartmentName in('sales','marketing')

SELECT d.departmentName, 
       MAX(salary) as MaxSalary
FROM   
       Employees e
JOIN    
       Departments d on d.departmentID=e.departmentID
group by 
       d.DepartmentName

SELECT c.FirstName+'  '+LastName AS CustomerName,
       o.OrderID,
	   o.orderDate
FROM orders o
JOIN customers c on c.customerID=o.customerID
WHERE c.city='USA' AND YEAR(orderDate)=2023

SELECT 
    c.FirstName+'  '+LastName AS CustomerName ,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.FirstName+'  '+LastName 

SELECT  p.productName, s.SupplierName
FROM Products p
JOIN Suppliers s on p.ProductID=s.SupplierID
WHERE S.SupplierName IN('gadget Supplies' ,'clothing Mart')

SELECT 
    c.FirstName+'  '+LastName AS CustomerName ,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.FirstName+'  '+LastName;

SELECT c.FirstName+'  '+LastName AS CustomerName , o.totalAmount as OrderTotol
FROM  Customers C 
JOIN Orders o on c.CustomerID=o.CustomerID
where o.TotalAmount>500

SELECT p.productName , s.SaleDate
FROM Products p
JOIN Sales s on p.ProductID=s.ProductID
WHERE YEAR(SaleDate)=2022 or p.Price>400

SELECT 
    p.ProductName,
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM 
    Products p
JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName;

SELECT e.Name, d.departmentName,e.salary
FROM Employees	e
JOIN Departments d on e.DepartmentID=d.DepartmentID
WHERE D.DepartmentName='HR' and e.Salary>60000

SELECT p.productName, s.SaleDate, p.StockQuantity
FROM Products p
JOIN Sales s on p.ProductID=s.ProductID
WHERE YEAR(saleDate)=2023 and p.StockQuantity>100

SELECT 
    e.Name,
    d.DepartmentName,
    e.HireDate
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'Sales'
    OR e.HireDate > '2020-12-31';

SELECT 
    c.FirstName+'  '+LastName AS CustomerName,
    o.OrderID,
    c.Address,
    o.OrderDate
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    c.Country = 'USA'
    AND c.Address LIKE '[0-9][0-9][0-9][0-9]%';

SELECT p.productName, p.category, s.SaleAmount
FROM Products p
JOIN Sales s on p.ProductID=s.ProductID
WHERE P.Category='ELECTRONICS' OR s.SaleAmount>350

SELECT c.categoryName, 
       COUNT(p.ProductID) as ProductCount
FROM Categories c
JOIN Products p on c.CategoryID=p.Category
GROUP BY c.CategoryName

SELECT c.FirstName+'  '+LastName AS CustomerName, c.city, o.OrderID, o.TotalAmount
FROM Customers c
JOIN Orders o on c.CustomerID=o.CustomerID
WHERE c.City='Los Angeles' and o.TotalAmount>300

SELECT 
    e.Name,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName IN ('HR', 'Finance')
    OR e.Name like '[AEIOUaeiou].*[AEIOUaeiou].*[AEIOUaeiou].*[AEIOUaeiou]';

SELECT 
    e.Name,
    d.DepartmentName,
    e.Salary
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName IN ('Sales', 'Marketing')
    AND e.Salary > 60000;
