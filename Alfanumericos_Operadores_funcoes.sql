/*Concatena��o de sequ�ncias
*/
USE TSQLFundamentals2008; 
SELECT empid, firstname+ N' '+ lastname AS NomeCompleto 
FROM HR.Employees;

/* A SQL ANSI dita que toda concatena��o com NULL deve Produzir NULL
*/
 SET CONCAT_NULL_YIELDS_NULL ON;
SELECT custid,country, region city, country + N',' + region + N''+ city AS Localidade
FROM Sales.Customers; 

--Solu��o
 SET CONCAT_NULL_YIELDS_NULL OFF;

SELECT custid,country, region city, country + N',' + region + N''+ city AS Localidade
FROM Sales.Customers;

--Tratando NULL como uma sequ�ncia vazia de uma maneira programatica com COALESCE
SELECT custid,country, region city, 
       country + N',' + COALESCE(region, 'vazio')+ city AS Localidade
FROM Sales.Customers;

--Substring
SELECT Substring('abcde', 1,3);

--Fun��o LEFT e RIGHT
/*Abrevia��es da Fun��o Substring
*/
SELECT RIGHT('abcde', 3)
SELECT LEFT('abcde', 3);

--LEN
SELECT LEN('abcde');

--DATALENGTH
SELECT DATALENGTH(N'abcde');

--CHARINDEX
SELECT charindex(' ','Itzik Ben-Gan');
SELECT charindex(' ','Carlito Eduardodefreitas');

--PATINDEX
SELECT PATINDEX('%[0-9]%','abcd123efgh');
 


