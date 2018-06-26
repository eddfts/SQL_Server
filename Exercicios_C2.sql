--Exercicios Pag. 112
--1). Retornar os pedidos em Junho de 2007.

USE TSQLFundamentals2008;
SELECT orderid, orderdate, custid, empid
FROM Sales.Orders 
--WHERE YEAR(orderdate) = 2007 AND MONTH(orderdate) = 06 
--"CORREÇÃO
WHERE YEAR(orderdate) = 2007 AND MONTH(orderdate) = 6
--SOLUÇÃO ACONSELHADA PELO AUTOR 
SELECT orderid, orderdate, custid, empid
FROM Sales.Orders 
WHERE orderdate >= '20070601'
AND orderdate < '20070701'
---------------------------------------------------------------------------------------
--2). Retorne os pedidosa estabelecidos no último dia do mês
USE TSQLFundamentals2008;
SELECT orderid, orderdate, custid, empid
FROM Sales.Orders 
WHERE orderdate = DATEADD( month ,DATEDIFF(month, '19991231', orderdate), '19991231')

SELECT DATEDIFF(month, '20050731', orderdate), orderdate -- DATEDIFF Aplica a diferença em meses
FROM Sales.Orders 

SELECT DATEADD(month, 12, orderdate), orderdate -- DATEADD adiciona meses a data 
FROM Sales.Orders 

---------------------------------------------------------------------------------------
--3). Retorne os funcionários cujo os nomes contenham  a letra 'a' duas vezes ou mais.

SELECT empid, firstname, lastname 
FROM HR.Employees
WHERE lastname LIKE N'%a%a%'

--------------------------------------------------------------------------------------
--4). Retorne os pedidos com o valor total (quantidade* preço unitário) maior que 10.000 classificados pelo 
--valor total.

SELECT orderid, SUM(unitprice * qty)  as valor_total
FROM Sales.OrderDetails
GROUP BY orderid 
HAVING SUM(unitprice * qty)  > 10000
ORDER BY  valor_total DESC;

----------------------------------------------------------------------------------------
--5). Retorne os três paises de entrega com os maiores fretamentos médios de 2007.

SELECT TOP(3) shipcountry, AVG(freight) as media, count(*) as cont
FROM Sales.Orders
WHERE orderdate >= '20070501' 
AND  orderdate < '20080101'
GROUP BY shipcountry
ORDER BY media DESC;
--------------------------------------------------------------------------------------------
/*6). Calcule o numero de linhas de pedidos baseados na classificação da data do 
*pedido usando o identificador do pedido como agente do desempate
*para cada cliente separadamente.
*/

SELECT custid, orderdate, orderid,
       ROW_NUMBER() OVER(PARTITION BY custid ORDER BY orderdate, orderid) AS rownum
FROM Sales.Orders
ORDER BY custid, rownum ASC;
---------------------------------------------------------------------------------------------------------------  
/*7). Estabeleça a instrução Select que retorne para cada funcionário o genero como base no 
*título cortesia (titleofcourtesy). Para 'Ms.' e 'Mrs.' retorne 'fermale', para 'Mr'....
*
*/
SELECT empid, firstname, lastname, titleofcourtesy,  CASE  WHEN titleofcourtesy = N'Ms.' THEN 'Female'
														   WHEN titleofcourtesy = N'Dr.' THEN 'Unknown'
														   WHEN titleofcourtesy = N'Mrs.' THEN 'Female'
														   WHEN titleofcourtesy = N'Mr.' THEN 'Male'
												     END AS genero		   	
FROM HR.Employees;

--Solução indicada pelo Autor
SELECT empid, firstname, lastname, titleofcourtesy,  
       CASE  WHEN titleofcourtesy IN('Ms.', 'Mrs.')  THEN 'Female'
             WHEN titleofcourtesy = 'Mr' THEN 'Male'
	   ELSE 'Unknown'
	   END AS Genero
From HR.Employees;
-----------------------------------------------------------------------------------------------------
/*9).retorne para cada cliente o identificador de clientes ea região. Classifique as linhas na saída
*por região, deixando a classificação dos NULLS por último (após os valores não NULL).
*/
SELECT  custid, region 
FROM Sales.Customers
ORDER BY 
       CASE WHEN  region IS NULL THEN 1 
	   ELSE 0 END, region



 