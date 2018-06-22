USE TSQLFundamentals2008;

SELECT orderid, custid,empid,orderdate
FROM Sales.Orders
WHERE orderdate = '20070212';


SELECT orderid, custid,empid,orderdate
FROM Sales.Orders
WHERE orderdate = CAST('20070212' AS DATETIME);

--LANGUAGE/DATEFORMAT
SET LANGUAGE British;
SELECT CAST('02/12/2007' AS datetime);

SET LANGUAGE us_english;
SELECT CAST('02/12/2007' AS datetime);

--CONVERT
--mm/dd/aaaa
SELECT CONVERT(datetime,'02/12/2007', 101);
--dd/mm/aaaa
SELECT CONVERT(datetime,'02/12/2007', 103);

--TRABALHANDO COM DATA E HORA SEPARADAMENTE 
--YEAR/MONTH
SELECT orderid
FROM Sales.Orders
WHERE YEAR(orderdate) = 2007;

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE orderdate >= '20070101' AND orderdate  < '20080101'

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE YEAR(orderdate)  = 2007 AND MONTH(orderdate) =2;

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE orderdate  >= '20070201' AND orderdate < '20070301';

--FUNÇÕES DE DATA E HORA
SELECT 
GETDATE() AS [GETDATE],
CURRENT_TIMESTAMP AS [CURRENT_TIMESTAMP],
GETUTCDATE() AS [GETUTCDATE],
SYSDATETIME() AS [SYSDATETIME],
SYSUTCDATETIME() AS [SYSUTCDATETIME],
SYSDATETIMEOFFSET() AS [SYSDATETIMEOFFSET]; 

SELECT 
CAST (SYSDATETIME() AS DATE) AS [DATA_ATUAL],
CAST (SYSDATETIME() AS TIME) AS [HORA_ATUAL];

SELECT CAST('20090212'as DATE);

SELECT CAST(SYSDATETIME() as DATE);


SELECT CAST(SYSDATETIME() as TIME);

SELECT  CONVERT(CHAR(8), CURRENT_TIMESTAMP, 112);

SELECT  CAST(CONVERT(CHAR(8), CURRENT_TIMESTAMP, 112) AS DATETIME);

SELECT  CONVERT(CHAR(12), CURRENT_TIMESTAMP, 114);

SELECT  CAST(CONVERT(CHAR(12), CURRENT_TIMESTAMP, 114) AS DATETIME);

--SWITCHOFFSET
/*Ajusta um valor de entrada DATETIMEOFFSET para um fuso horário especificado.
*/

SELECT SWITCHOFFSET(SYSDATETIMEOFFSET(),'-05:00' ); 

/*A seguir ajusta o valor datetimeoffset para atual UTC (Universal Time Coordinated)
*O Tempo Universal Coordenado, também conhecido como tempo civil, é o fuso horário 
*de referência a partir do qual se calculam todas as outras zonas horárias do mundo.
*/


SELECT SWITCHOFFSET(SYSDATETIMEOFFSET(),'+00:00' ); 

--TODATETIMEOFFSET
/*Define o deslocamento de fuso horário de um valor de data e de hora de 
*entrada.
*/

SELECT TODATETIMEOFFSET(SYSDATETIME(),'-05:00');

--DATEADD
/*Permite adicionar um número especifico de unidades de uma parte relativa á data especificada 
*em um valor de data e de hora de entrada.
*/

SELECT DATEADD(YEAR, 1, '20090212');
SELECT DATEADD(MONTH, 1, '20090212');
SELECT DATEADD(DAY, 60, '20090212');

--DATEDIFF
/*
*Retorna a diferença entre dois valoresde data e de hora
*/
SELECT DATEDIFF(day,'20080212','20090212' );
SELECT DATEDIFF(month,'20080212','20090212' );
SELECT DATEDIFF(YEAR,'20080212','20090212' );

SELECT DATEADD (day, DATEDIFF(day, '20010101', CURRENT_TIMESTAMP), '20010101');

--DATEPART
/*Retorna um numero inteiro que representa uma parte solicitada de um determinado valor de data 
*e hora
*/
SELECT DATEPART(month,'20090312') AS MES;

--YEAR, MONTH e DAY

SELECT 
	DAY('20090212') AS dia ,
	MONTH('20090212') AS mes,
	YEAR('20090212') AS ano;

--DATENAME
/*Retorna, quando definido como mes retorna o nome por extenso, depende do idioma da seção
*/
--SET language us_english;
SELECT DATENAME(MONTH,'20090212');
SELECT DATENAME(YEAR,'20090212');

--ISDATE
/*Aceita uma sequencia de caracteres como enatrada e retorna 1 caso ela seja conversivel em 
*um tipo de dados Data e hora, caso contrario retorna 0. se é uma data válida ou não.
*/

SELECT  ISDATE ('20090212');
SELECT  ISDATE ('20090235');
