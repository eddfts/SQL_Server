--Cross Join 
USE TSQLFundamentals2008;
SELECT C.custid, E.empid
FROM Sales.Customers AS C
CROSS JOIN HR.Employees AS E;

--Sintaxe mais antiga
SELECT C.custid, E.empid
FROM Sales.Customers As C, HR.Employees AS E;


--Self Join 
USE TSQLFundamentals2008;
SELECT 
  E1.empid, E1.firstname, E1.lastname, 
  E2.empid, E2.firstname, E2.lastname
FROM HR.Employees AS E1
CROSS JOIN HR.Employees E2

--
USE tempdb;
IF OBJECT_ID('dbo.Digits', 'U') IS NOT NULL DROP TABLE dbo.Digits;
CREATE TABLE dbo.Digits(digit INT NOT NULL PRIMARY KEY);
INSERT INTO dbo.Digits(digit) 
VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

SELECT digit FROM dbo.Digits;

SELECT D3.digit * 100 + D2.digit * 10 + D1.digit + 1 AS N
FROM dbo.Digits AS D1
    CROSS JOIN dbo.Digits D2
	CROSS JOIN dbo.Digits D3
ORDER BY N;

--INNER JOIN 
USE TSQLFundamentals2008;
SELECT E.empid, E.firstname, E.lastname, O.orderid
FROM HR.Employees AS E
 JOIN Sales.Orders AS O 
  ON E.empid = O.empid;

--Sintaxe SQL-89 ANSI
USE TSQLFundamentals2008;
SELECT E.empid, E.firstname, E.lastname, O.orderid
FROM HR.Employees AS E, Sales.Orders AS O
WHERE E.empid = O.empid

--COMPOSITE JOINS 
USE TSQLFundamentals2008;
IF OBJECT_ID('Sales.OrderDetailsAudit','U') IS NOT NULL
	DROP TABLE Sales.OrderDetailsAudit;
	CREATE TABLE Sales.OrderDetailsAudit
	(
		lns INT NOT NULL IDENTITY,
		orderid INT NOT NULL, 
		productid INT NOT NULL,
		dt DATETIME NOT NULL,
		loginname SYSNAME NOT NULL,
		columnname SYSNAME NOT NULL,
		oldval SQL_VARIANT,
		newval SQL_VARIANT,
		CONSTRAINT PK_OrderDetailsAudit PRIMARY KEY(lns),
		CONSTRAINT FK_OrderDetailsAudit_OrderDetails 
			FOREIGN KEY(orderid, productid) 
			REFERENCES Sales.OrderDetails(orderid, productid)
	);

	SELECT OD.orderid, OD.productid, OD.qty, ODA.dt, ODA.loginname, ODA.oldval, ODA.newval
	FROM Sales .OrderDetails AS OD
	  JOIN Sales.OrderDetailsAudit AS ODA 
	  ON OD.orderid = ODA.orderid
	  AND OD.productid = ODA.productid
	WHERE ODA.columnname = N'qty';
	
	--NON-equi JOINS
	--Elimina os pares identicos como o resultado de Cross Joins

	SELECT 
	     E1.empid, E1.firstname, E1.lastname, 
		 E2.empid, E2.firstname, E2.lastname
	FROM HR.Employees AS E1
		JOIN HR.Employees E2
		  ON E1.empid < E2.empid;

--MULTI-table-JOINS
USE TSQLFundamentals2008;
SELECT C.custid, C.companyname, O.orderid, OD.productid, od.qty
FROM Sales.Customers AS C
 JOIN Sales.Orders AS O
   ON C.custid = O.custid
    JOIN Sales.OrderDetails  AS OD
	  ON O.orderid = OD.orderid

--OUTER JOINS
/* A palavra-chave LEFT significa que as linhas da tabela esquerda são preservadas, a palavra-chave RIGHT 
 *significa que as linhas da tabela direita são preservadas e a palavra chave FULL significa que as linhas 
 *das duas tabelas são preservadas.
 */
 SELECT C.custid, C.companyname, O.orderid
 FROM Sales.Customers AS C
   LEFT OUTER JOIN Sales.Orders AS O
     ON C.custid = O.custid  
--Retornando  somente as linhas externas - consumidores que não tem pedidos
 USE TSQLFundamentals2008;
 SELECT C.custid, C.companyname, O.orderid
 FROM Sales.Customers AS C
   LEFT OUTER JOIN Sales.Orders AS O
     ON C.custid = O.custid  
 WHERE O.orderid IS NULL;

      
	                                                                                                                                                        