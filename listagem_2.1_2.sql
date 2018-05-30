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
 *Classifica as linhas na sa�da pelo identificador de funcion�rios e pelo ano do pedido
 */
SELECT  empid, YEAR(orderdate) As PedidosAno, COUNT(*) AS qtdPedidos 
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1
--ORDER BY empid, PedidosAno
ORDER BY 1,2

/*ORDER BY sem que o atributo apare�a na clausula SELECT
*/
SELECT empid, firstname, lastname, country--, hiredate
FROM HR.Employees
Order By hiredate;

--OP��O TOP
/*
*Retornar da tabela de Orders os cinco pedidos mais recentes,
*Quando a op��o TOP � usada, a mesma clausula ORDER BY serve a determinar
* a Prioridade l�gica de TOP.
*/
SELECT TOP (5) orderid, orderdate, custid, empid
FROM Sales.Orders
ORDER BY orderdate DESC;

/*
*Calcula o n�mero de linhas a ser retornado com base em  uma porcentagem do numero 
*de linhas. A Consulta vai retornar 83 linhas porque a tabela possui 830 registros.
*O DESC Pode ser utilizado em uma quest�o de desempate.
*P�g.: 64 Livro Microsoft SQL Server 2008Fundamentos em T_SQL. 
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

/*
*Nesta segunda query ele adiciona mais tr�s registros depois do  registro
* de orderid 11073. Embora em TOP Tenhamos definido apenas 5 registros.
*/
SELECT TOP (5) WITH TIES orderid, orderdate, custid, empid
FROM Sales.Orders 
ORDER BY orderdate DESC;


--CL�USULA OVER
/*
*Opera no contexto da Cl�usula Group By, Retornara somente uma linha para cada grupo.
*/
SELECT *	    
FROM Sales.OrderValues;

SELECT orderid, custid, val, 
       SUM(val) OVER() AS ValorTotal, --retorna o valor total de todos os registros
	   SUM(val) OVER(PARTITION  BY custid) AS ValorTotalCust  --Retorna o valor total de todos do mesnto custid
FROM Sales.OrderValues

SELECT SUM (val)
FROM Sales.OrderValues 
--CL�USULA OVER FUN��ES: 
/*
 *ROW_NUMBER, RANK, DENSE_RANK  e NTILE
 */
SELECT orderid, custid, val,
       ROW_NUMBER() OVER(ORDER BY val) AS rownum, -- N�meros inteiros sequenciais de incremento as linhas
	   RANK()       OVER(ORDER BY val) AS rank,   --Ranque por exemplo, a linha 8 o valor(val) � o 7(s�timo) maior
	                                              -- na tabela, ou seja rank indica quantas linhas tem valor abaixo.  
	   DENSE_RANK() OVER(ORDER BY  val) AS dense_rank,-- O mesmo que dense por�m, indica quantos valores distintos tem
	                                                  -- abaixo.
	   NTILE(10)    OVER(ORDER BY val) AS ntile --Como foi especificado NTILE(10) a func�o vai pegar  esse valor 
	                                            --e dividir pelo total de linhas 830 (830/10 = 83)
												--como OVER(Order BY val) ele vai ordenar 83 valores mais baixos 
FROM Sales.OrderValues
ORDER BY val;



