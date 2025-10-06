SELECT e.name , e.salary, d.departmentName
from Employees e
JOIN Departments d on e.DepartmentID=d.DepartmentID	
WHERE Salary>50000

SELECT c.firstName+'  '+lastName as FullName, o.orderDate
FROM Customers C
JOIN Orders o on c.CustomerID=o.CustomerID
where YEAR(OrderDate)=2023

SELECT e.Name ,d.departmentName
FROM Employees e
left JOIN Departments d on e.DepartmentID=d.DepartmentID

SELECT s.SupplierName, p.ProductName
FROM Products p
JOIN Suppliers s on s.SupplierID=p.SupplierID

SELECT o.orderId, o.orderDate, p.PaymentDate, p.Amount
FROM Orders o
FULL OUTER JOIN Payments p on o.OrderID=p.OrderID

SELECT e.Name as EmployeeName ,
      m.Name as ManagerName
	   From Employees e
	    left JOIN employees m
	   on e.managerID=m.EmployeeID

SELECT s.Name, c.courseName
FROM Students s
JOIN Enrollments e on s.StudentID=e.StudentID
JOIN Courses c on e.CourseID=c.CourseID
WHERE CourseName='Math 101'

SELECT c.FirstName+'   '+LastName as FullName,o.quantity
FROM Customers c
JOIN Orders o on c.CustomerID=o.CustomerID
WHERE Quantity>3

SELECT E.NAME ,D.DepartmentName
FROM Employees e
JOIN Departments d on e.DepartmentID=d.DepartmentID
WHERE DepartmentName='human resources'

SELECT 
      d.departmentName, 
	  COUNT(E.EmployeeID ) AS EmployeeCount
FROM
      Employees e 
JOIN 
      Departments d on d.departmentID=e.departmentID
GROUP BY
      departmentName 
HAVING 
      COUNT(E.employeeID)>5

SELECT 
    p.ProductID,
    p.ProductName
FROM 
    Products p
LEFT JOIN 
    Sales s ON p.ProductID = s.ProductID
WHERE 
    s.ProductID IS NULL;


SELECT c.firstname, c.lastname, 
COUNT(orderID) as totolOrders
FROM Customers c
JOIN Orders o on c.CustomerID=o.CustomerID
GROUP BY C.FirstName, C.LastName
HAVING COUNT(OrderID)>=1

SELECT 
    e.Name,
    d.DepartmentName
FROM 
    Employees e
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

SELECT e1.Name as employee1,
       e2.Name as employee2,
	   e1.ManagerID
FROM 
      Employees e1
JOIN
      employees e2
	  on e1.managerID=e2.ManagerID
	  and e1.employeeID<e2.EmployeeID
WHERE 
    e1.ManagerID IS NOT NULL;

SELECT o.orderID, o.orderDate,c.firstName+'  '+lastName AS FullName
FROM Customers c
JOIN Orders o on o.CustomerID=c.CustomerID
WHERE YEAR(OrderDate)=2022

SELECT e.Name , e.salary, d.DepartmentName
FROM Employees e
JOIN Departments d on e.DepartmentID=d.DepartmentID
WHERE DepartmentName='Sales' and Salary>60000

SELECT o.orderID, o.orderDate, p.paymentDate,p.amount
from Payments p 
 join Orders o on o.OrderID=p.OrderID

SELECT P.productID, p.ProductName
from  Products p
left join Orders o on p.ProductID=o.ProductID
where o.OrderID  is null

SELECT 
    e.Name,
    e.Salary
FROM 
    Employees e
WHERE 
    e.Salary > (
        SELECT 
            AVG(Salary)
        FROM 
            Employees
        WHERE 
            DepartmentID = e.DepartmentID
    );

SELECT o.orderID, o.orderDate
FROM Orders o
LEFT JOIN Payments p on o.OrderID=p.OrderID
WHERE YEAR(OrderDate)<2020 AND p.OrderID is null

SELECT p.productName, p.productID
FROM Products p
left join Categories c on p.Category=c.CategoryID
where c.CategoryID is null

SELECT e1.Name as employee1,
       e2.Name as employee2,
	   e1.ManagerID,
	   e1.Salary
FROM
      Employees e1
JOIN Employees e2 on e1.ManagerID=e2.ManagerID
     and e1.EmployeeID<e2.EmployeeID
WHERE 
     E1.ManagerID IS NOT NULL
	 AND e1.Salary>60000
	 AND e2.Salary>60000

SELECT e.Name , d.departmentName
From Employees e
JOIN Departments d on e.DepartmentID=d.DepartmentID
WHERE DepartmentName like 'M%'

SELECT s.saleID, p.productName, s.SaleAmount
FROM Sales s
JOIN Products p on s.ProductID=p.ProductID
WHERE s.SaleAmount>500

SELECT s.StudentID, s.Name
FROM Students s
JOIN Enrollments e on s.StudentID=e.StudentID
JOIN Courses c on e.CourseID=c.CourseID
WHERE CourseName<>'Math 101'

SELECT o.orderID, o.orderDate, p.paymentID
FROM Orders o
left join Payments p on o.orderID=p.OrderID
WHERE p.PaymentID is  null 

SELECT p.productID, p.productName, c.categoryName
FROM Products p
join Categories c on p.Category=c.CategoryID
where c.CategoryName IN ('Electronics', 'Furniture');


