USE TSQLFundamentals2008;
--PREDICADOS
/*IN
*/
SELECT orderid,empid orderdate
FROM Sales.Orders
WHERE orderid IN(10248,10249,10250);

/*BETWEEN
*/
SELECT orderid,empid orderdate
FROM Sales.Orders
WHERE orderid BETWEEN 10300 AND 10310;

/*LIKE
*/
SELECT empid, firstname, lastname
FROM HR.Employees
WHERE lastname LIKE N'D%';

--OPERADORES
SELECT orderid, empid, orderdate
FROM Sales.Orders
WHERE orderdate >= '20080101'; 



SELECT orderid, empid, orderdate
FROM Sales.Orders
WHERE orderdate >= '20080101'
AND empid IN (1,3,5); 


SELECT orderid, productid, qty, unitprice, discount, 
		qty * unitprice * (1 - discount) AS val
FROM Sales.OrderDetails;


