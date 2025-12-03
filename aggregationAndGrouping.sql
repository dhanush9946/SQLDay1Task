CREATE DATABASE Day3;
GO
USE Day3;

--Employee table
Create TABLE Employees(EmpId int,
                       EmpName varchar(50),
                       Department varchar(50),
                       Salary INT,
                       HireDate Date);

INSERT INTO Employees Values(1, 'Arun', 'IT', 50000, '2020-01-05'),
                            (2, 'Kiran', 'HR', 40000, '2019-03-12'),
                            (3, 'Ravi', 'IT', 55000, '2021-07-18'),
                            (4, 'Meena', 'Finance', 60000, '2018-11-25'),
                            (5, 'Divya', 'Finance', 45000, '2020-04-14'),
                            (6, 'Ajay', 'IT', 70000, '2022-10-03'),
                            (7, 'Rita', 'HR', 38000, '2021-01-22');
SELECT * FROM Employees;


--Students table
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50),
    Class VARCHAR(20),
    Subject VARCHAR(50),
    Marks INT
);
go

INSERT INTO Students VALUES
(1, 'Amit', '10A', 'Maths', 85),
(2, 'Sana', '10A', 'Science', 78),
(3, 'John', '10B', 'Maths', 92),
(4, 'Megha', '10B', 'Science', 65),
(5, 'Ali', '10A', 'Maths', 72),
(6, 'Rohit', '10B', 'Science', 88),
(7, 'Priya', '10A', 'Maths', 95);


--Sales Table
CREATE TABLE Sales (
    SaleID INT,
    Product VARCHAR(50),
    Quantity INT,
    Amount INT,
    SaleDate DATE
);
go

INSERT INTO Sales VALUES
(1, 'Mobile', 2, 20000, '2024-01-10'),
(2, 'Laptop', 1, 50000, '2024-01-15'),
(3, 'Mobile', 1, 10000, '2024-02-05'),
(4, 'Tablet', 3, 45000, '2024-02-15'),
(5, 'Laptop', 2, 90000, '2024-03-10'),
(6, 'Mobile', 3, 30000, '2024-03-25');

--Products Table
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price INT,
    Stock INT
);
go

INSERT INTO Products VALUES
(1, 'Mobile A', 'Electronics', 15000, 25),
(2, 'Laptop B', 'Electronics', 60000, 10),
(3, 'Chair C', 'Furniture', 3000, 50),
(4, 'Table D', 'Furniture', 7000, 30),
(5, 'Headphones E', 'Electronics', 2500, 40);

--Order Table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    Product VARCHAR(50),
    Quantity INT,
    OrderDate DATE
);
go

INSERT INTO Orders VALUES
(1, 101, 'Mobile', 1, '2024-01-01'),
(2, 102, 'Laptop', 1, '2024-01-05'),
(3, 101, 'Mobile', 2, '2024-02-10'),
(4, 103, 'Tablet', 1, '2024-02-20'),
(5, 101, 'Laptop', 1, '2024-03-01'),
(6, 102, 'Mobile', 1, '2024-03-15'),
(7, 104, 'Laptop', 1, '2024-03-25');

select * from Students;
select * from Employees;
select * from Sales;
select * from Products;
select * from Orders;


--Count employees in each department
select Department,Count(*) AS TotalEmployees 
from Employees Group by Department;

--Find total salary paid in each department
Select Department,Sum(Salary) as TotalSalary
from EMPLOYEES
Group by Department;

--Find minimum salary in each department
Select Department,Min(Salary) as Lowestsalary  
from Employees group by Department;

--Find maximum salary in each department
SELECT Department,MAX(Salary) as HighestSalary
from Employees
Group bY dEpartment;

--Find average salary in each department
SELECT Department,AVG(Salary) as averageSalary
from Employees
group by department;



----------------------------------------
--Count number of students in each class
Select Class,Count(*) as TotalStudents
FROM Students
group by class;

--Find total marks scored per subject
Select Subject,SUM(Marks) AS TotalMark
from Students
group by Subject;

----------------------------------
--Count total sales per product
select Product,count(*) as TotalSales
from Sales
GROUP BY Product;

--Find total revenue per product
select Product,SUM(Amount) as TotalRevenue
from sales
group by Product;


--Find average selling price per product
SELECT Product,avg(Amount)  as avgPrice
from sales
group by Product;

--------------------------------
--Count how many orders each customer placed
Select CustomerId,count(*) as NoOfOrders
from Orders
group by customerId;

--Show the number of employees hired each year
select year(HireDate) as years ,count(*) as employees
from Employees
group by year(HireDate);

--Show the number of products in each category

select category,count(ProductName) as NoOfProducts
from Products group by Category;

--Find total stock per category
select Category,sum(Stock) as TotalStock
from Products
group by Category;

--Show departments with more than 5 employees
select Department,count(*) as EmpCount
from employees
group by Department having count(*)>2;

--Show products with total sales greater than 10 units
select * from sales
select Product,sum(Quantity) as totalSales
from Sales
GROUP BY Product
having sum(Quantity)>1;

--Show subjects where average marks are above 70
select * from students

select Subject,avg(Marks) as averageMark
from students
group by subject having avg(marks)>70;

--Show customers who placed more than 3 orders
select CustomerId,count(*) as orders
from Orders
group by CustomerId having count(*)>1;

--Show products priced above average price
select * from Products;

select ProductName,avg(Price)
from Products
where price > (select avg(price) from Products); 