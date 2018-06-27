--Cross Join 
USE TSQLFundamentals2008;
SELECT C.custid, E.empid
FROM Sales.Customers AS C
CROSS JOIN HR.Employees AS E;

--Sintaxe mais antiga
SELECT C.custid, E.empid
FROM Sales.Customers As C, HR.Employees AS E;


--Self Join 
