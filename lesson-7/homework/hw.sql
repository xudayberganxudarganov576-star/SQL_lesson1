SELECT ProductName, price 
FROM products
WHERE price=(SELECT MIN(price) FROM products);



SELECT FirstName, LastName, Salary 
FROM Employees
WHERE Salary=(SELECT MAX(Salary) FROM Employees);

SELECT COUNT(*) AS Totol_rows
FROM Products;

SELECT COUNT(DISTINCT category) AS kategoriya_soni
FROM Products;

SELECT SUM(SaleAmount) AS TotolAmount
from Sales
WHERE ProductID=7;

SELECT AVG(Age) AS ortacha_yosh
FROM Employees;


SELECT DepartmentName, COUNT(*) AS employee_count
FROM Employees
GROUP BY DepartmentName;

SELECT category, 
       MIN(price) AS min_price, 
       MAX(price) AS max_price
FROM Products
GROUP BY category;

SELECT customerid, 
       SUM(saleamount) AS total_sales
FROM Sales
GROUP BY customerid;


SELECT DepartmentName
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;

select productId,
      SUM(SaleAmount) AS Totol_Amount,
	  AVG(SaleAmount) AS Avarage_Sale
	  FROM Sales
	  GROUP BY ProductID;

SELECT COUNT(*) AS employee_count
FROM employees
WHERE departmentName = 'HR';

SELECT 
    departmentName,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM 
    employees
GROUP BY 
    departmentName;

SELECT 
    departmentName,
   AVG(Salary) AS Avarage_Salary
FROM 
    employees
GROUP BY 
    departmentName;

SELECT 
    departmentName,
   AVG(Salary) AS Avarage_Salary,
   COUNT(*) AS Employee_Count
FROM 
    employees
GROUP BY 
    departmentName;

SELECT 
    category,
    AVG(price) AS avg_price
FROM 
    products
GROUP BY 
    category
HAVING 
    AVG(price) > 400;

SELECT 
    YEAR(saledate) AS sale_year,
    SUM(saleamount) AS total_sales
FROM 
    Sales
GROUP BY 
    YEAR(saledate)
ORDER BY 
    sale_year;

SELECT 
    customerid,
    COUNT(*) AS order_count
FROM 
    orders
GROUP BY 
    customerid
HAVING 
    COUNT(*) >= 3;

SELECT DepartmentName,
AVG(Salary) AS AVG_Salary
FROM Employees
Group BY DepartmentName
HAVING AVG(Salary)>60000;

SELECT  Category,
AVG(Price) AS AVG_Price
FROM Products
GROUP BY Category
HAVING AVG(Price)>150;

SELECT CustomerID,
SUM(SaleAmount) as Totol_Amount
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount)>1500;

SELECT DepartmentName,
SUM(Salary) as Totol_Salary,
AVG(Salary) AS AVG_Salary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary)>65000;

SELECT
    customerid,
    SUM(CASE WHEN freight > 50 THEN freight ELSE 0 END) AS total_freight_over50,
    MIN(freight) AS min_freight
FROM
    Sales
GROUP BY
    customerid
;

SELECT 
    YEAR(OrderDate) AS order_year,
    MONTH(OrderDate) AS order_month,
    SUM(TotalAmount) AS total_sales,
    COUNT(DISTINCT ProductID) AS unique_products_sold
FROM 
    Orders
GROUP BY 
    YEAR(OrderDate),
    MONTH(OrderDate)
HAVING 
    COUNT(DISTINCT ProductID) >= 2
ORDER BY 
    order_year, order_month;

SELECT 
    YEAR(OrderDate) AS order_year,
    MIN(Quantity) AS min_quantity,
    MAX(Quantity) AS max_quantity
FROM 
    Orders
GROUP BY 
    YEAR(OrderDate)
ORDER BY 
    order_year;
