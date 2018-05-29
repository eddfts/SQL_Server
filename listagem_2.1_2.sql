--CLAUSULA SELECT
USE TSQLFundamentals2008;
SELECT orderid, orderdate
/*orderid as PedidoIdentificacao
 *orderid = PedidoIdentificacao
 *orderid  PedidoIdentificacao
 */
FROM Sales.Orders

--DISTINCT
SELECT  empid, YEAR(orderdate) As PedidosAno 
FROM Sales.Orders
WHERE custid = 71
--AND empid = 1

SELECT DISTINCT empid, YEAR(orderdate) As PedidosAno 
FROM Sales.Orders
WHERE custid = 71;

--CLAUSULA ORDER BY
/*
 *Classifica as linhas na saída pelo identificador de funcionários e pelo ano do pedido
 */
SELECT  empid, YEAR(orderdate) As PedidosAno, COUNT(*) AS qtdPedidos 
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1
--ORDER BY empid, PedidosAno
ORDER BY 1,2

/*ORDER BY sem que o atributo apareça na clausula SELECT
*/
SELECT empid, firstname, lastname, country--, hiredate
FROM HR.Employees
Order By hiredate;

--OPÇÃO TOP
/*
*Retornar da tabela de Orders os cinco pedidos mais recentes,
*Quando a opção TOP é usada, a mesma clausula ORDER BY serve a determinar
* a Prioridade lógica de TOP.
*/
SELECT TOP (5) orderid, orderdate, custid, empid
FROM Sales.Orders
ORDER BY orderdate DESC;

/*
*Calcula o número de linhas a ser retornado com base em  uma porcentagem do numero 
*de linhas. A Consulta vai retornar 83 linhas porque a tabela possui 830 registros.
*O DESC Pode ser utilizado em uma questão de desempate.
*Pág.: 64 Livro Microsoft SQL Server 2008Fundamentos em T_SQL. 
*/
SELECT TOP (10) PERCENT orderid, orderdate, custid, empid
FROM Sales.Orders 
ORDER BY orderdate DESC;

SELECT TOP (1) PERCENT orderid, orderdate, custid, empid
FROM Sales.Orders 
ORDER BY orderdate DESC;

--WHIT TIES
SELECT TOP (5)  orderid, orderdate, custid, empid
FROM Sales.Orders 
ORDER BY orderdate DESC, orderid DESC;


SELECT TOP (5) WITH TIES orderid, orderdate, custid, empid
FROM Sales.Orders 
ORDER BY orderdate DESC;
/*
*Nesta segunda query ele adiciona mais três registros de pois do  registro
* de orderid 11073. Embora em TOP Tenhamos definido apenas 5 registros.
*/






