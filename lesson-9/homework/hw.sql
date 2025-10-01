select s.supplierName, p.productName
from Products p
INNER JOIN Suppliers s on s.supplierID=p.SupplierID

SELECT e.Name , d.DepartmentName
FROM Employees e
Cross join Departments d

SELECT p.ProductName, s.SupplierName 
FROM Products p
INNER JOIN Suppliers s  on p.SupplierID=s.SupplierID

SELECT c.firstNAme+LAstName as FullName, o.orderID
FROM Customers c
INNER JOIN orders o on o.customerID=c.customerID

SELECT s.Name, c.courseName
FROM students s
CROSS JOIN Courses c

SELECT p.productName , o.orderID
FROM Products p
INNER JOIN Orders o on p.ProductID=o.ProductID

SELECT e.Name, d.departmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID=d.DepartmentID

SELECT s.Name, e.CourseID
FROM Students s
INNER JOIN Enrollments e on s.StudentID=e.StudentID

SELECT o.customerID, p.paymentID
FROM Orders o
INNER JOIN Payments p on o.orderID=p.OrderID

SELECT p.productName, o.orderID
FROM Products p
INNER JOIN Orders o on p.ProductID=o.ProductID
where Price>100;

SELECT e.Name , d.departmentName
FROM Employees e
INNER JOIN Departments d on e.DepartmentID<>d.DepartmentID

SELECT p.productName, o.orderID
FROM Products p
INNER JOIN Orders o on p.productID=o.ProductID
where Quantity>StockQuantity

SELECT c.FirstName+'  '+LastName as FullName, s.productID
FROM Customers c
INNER JOIN Sales s on c.CustomerID=s.CustomerID
WHERE SaleAmount>=500;

SELECT s.Name, c.courseName
FROM Students s
JOIN Enrollments e on s.studentID=e.StudentID
JOIN Courses c on c.CourseID=e.CourseID

SELECT p.productName, s.supplierName
FROM Products p
INNER JOIN Suppliers s on p.SupplierID=s.SupplierID
WHERE SupplierName LIKE '%Tech%'

SELECT  p.amount
FROM Payments p
INNER JOIN Orders o on p.OrderID=o.OrderID
where Amount<TotalAmount

SELECT e.Name , d.DepartmentName
FROM Employees e
INNER JOIN Departments d on e.DepartmentID=d.DepartmentID

SELECT p.productName, c.categoryName
FROM Products p
INNER JOIN Categories c ON p.category = c.categoryID
WHERE c.categoryName IN ('Electronics', 'Furniture');

SELECT c.FirsTName+'  '+LastName AS FullName, s.SaleID
from Customers c
INNER JOIN Sales s on c.customerID=s.CustomerID
WHERE Country='USA'

SELECT c.FirstName+'  '+LastName AS FullName, o.orderID
FROM Customers c
INNER JOIN Orders o on c.CustomerID=o.CustomerID
WHERE Country='GERMANY'

SELECT Name
FROM Employees
GROUP BY DepartmentID

SELECT 
    E1.employeeid AS employee1_id,
    E1.name AS employee1_name,
    E1.departmentid AS department1,
    E2.employeeid AS employee2_id,
    E2.name AS employee2_name,
    E2.departmentid AS department2
FROM 
    Employees E1
JOIN 
    Employees E2
    ON E1.employeeid < E2.employeeid
    AND E1.departmentid <> E2.departmentid;


SELECT p.ProductName, o.quantity*price as NotEqual
FROM Orders o
JOIN Products p on p.ProductID=o.ProductID
JOIN Payments pk on pk.OrderID=o.OrderID
where quantity*price<>TotalAmount

SELECT s.Name, c.courseName
FROM Students s
JOIN Enrollments e on s.StudentID=e.StudentID
JOIN Courses  c on c.CourseID=e.courseID
WHERE e.CourseID is null

SELECT 
    M.employeeid AS manager_id,
    M.name AS manager_name,
    M.salary AS manager_salary,
    E.employeeid AS employee_id,
    E.name AS employee_name,
    E.salary AS employee_salary
FROM 
    Employees E
JOIN 
    Employees M ON E.managerid = M.employeeid
WHERE 
    M.salary <= E.salary;

SELECT 
    C.customerid,
    C.FirstName+'  '+lastName as FullName,
    O.orderid
FROM 
    Customers C
JOIN 
    Orders O ON C.customerid = O.customerid
LEFT JOIN 
    Payments P ON O.orderid = P.orderid
WHERE 
    P.paymentid IS NULL;







