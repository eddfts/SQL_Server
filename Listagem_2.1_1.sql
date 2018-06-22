
--CLAUSULA SELECT
USE TSQLFundamentals2008;
/*Use define o contexto do Banco de dados de sua sessão.
*/
SELECT empid, YEAR(orderdate) AS PedidoAno, COUNT(*) AS QtdPedido
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1
ORDER BY empid, PedidoAno;

--CLAUSULA FROM 
SELECT orderid, custid, empid, orderdate, freight  
/* identificadores
* Ansi:"orderid", "custid", "empid"...
* SQL Server: [orderid], [custid], [empid]...
*/
FROM Sales.Orders;

--CLAUSULA WHERE 
SELECT orderid, custid, empid, orderdate, freight
FROM   Sales.Orders
WHERE  custid = 71;


--CLAUSULA GROUP BY
SELECT empid, YEAR(orderdate)
FROM   Sales.Orders
WHERE  custid = 71
GROUP BY empid, YEAR(orderdate);

/*
*Como uma função agregada retorna um valor único por grupo, os elementos que não 
*participam da lista GROUP BY Só são autorizados como entrada em uma função agre_
*gada como: COUNT, SUM , AVG, MIN, MAX. 
*/
SELECT empid,
       YEAR(orderdate) AS PedidoAno,
	   SUM(freight) AS TotalFrete,
	   COUNT(*) as QtdPedido 
FROM   Sales.Orders
WHERE  custid = 71
GROUP BY empid, YEAR(orderdate);

--CLAUSULA HAVING
/*Utilizado para filtrar grupos ao invés de linhas.
*/
SELECT  empid, YEAR(orderdate) AS PedidoAno
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING YEAR(orderdate) > 2005 --COUNT(*) >1





