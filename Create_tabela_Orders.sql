use testedb;
IF OBJECT_ID('dbo.Orders','U') IS NOT NULL
DROP TABLE dbo.Orders;
CREATE TABLE dbo.Orders
(
 orderid INT NOT NULL,
 ordered INT NOT NULL,
 empid   INT NOT NULL,
 custid VARCHAR(10) NOT NULL,
 orderts DATETIME NOT NULL,
 qty INT NOT NULL,

 CONSTRAINT PK_Orders
 PRIMARY KEY(orderid)

);


ALTER TABLE dbo.Orders
ADD CONSTRAINT FK_Orders_Employees
FOREIGN KEY(empid)
REFERENCES dbo.Employees(empid);
