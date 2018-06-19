/*Concatenação de sequências
*/
USE TSQLFundamentals2008; 
SELECT empid, firstname+ N' '+ lastname AS NomeCompleto 
FROM HR.Employees;

/* A SQL ANSI dita que toda concatenação com NULL deve Produzir NULL
*/
 SET CONCAT_NULL_YIELDS_NULL ON;
SELECT custid,country, region city, country + N',' + region + N''+ city AS Localidade
FROM Sales.Customers; 

--Solução
 SET CONCAT_NULL_YIELDS_NULL OFF;

SELECT custid,country, region city, country + N',' + region + N''+ city AS Localidade
FROM Sales.Customers;

--Tratando NULL como uma sequência vazia de uma maneira programatica com COALESCE
SELECT custid,country, region city, 
       country + N',' + COALESCE(region, 'vazio')+ city AS Localidade
FROM Sales.Customers;

--Substring
SELECT Substring('abcde', 1,3);

--Função LEFT e RIGHT
/*Abreviações da Função Substring
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

--REPLACE 
SELECT REPLACE('1-a 2-b','-',':');
 
 --REPLICATE
 SELECT REPLICATE('abc',3);
 SELECT supplierid,
        RIGHT(REPLICATE('0', 9)+ CAST(supplierid AS varchar(10)),10) AS strsupplierid
 FROM Production.Suppliers;

 --STUFF
 SELECT STUFF('xyz', 2,1,'abc');
 
 --UPPER, LOWER
 SELECT UPPER('Carlos Eduardo');
 SELECT LOWER('Carlos Eduardo');

--RTRIM e LTRIM
SELECT RTRIM(LTRIM(' abc '));

--O predicado LIKE

--Funcionários cujo o sobrenome começa com D
SELECT empid, lastname
FROM  HR.Employees
WHERE lastname LIKE N'D%';

--funcionaários cujo o segundo caracter do sobrenome E
SELECT empid, lastname
FROM  HR.Employees
WHERE lastname LIKE N'_e%';


--Funcionários onde o primeiro caracter do sobrenome seja'A', 'B', ou 'C'
SELECT empid, lastname
FROM  HR.Employees
WHERE lastname LIKE N'[ABC]%';

--Funcionários onde o primeiro caracter do sobrenome esteja entre 'A' e 'E'
SELECT empid, lastname
FROM  HR.Employees
WHERE lastname LIKE N'[A-E]%';

--Funcionarios onde o primeiro caracter do sobrenome não esteja entre 'A'e'E'
SELECT empid, lastname
FROM  HR.Employees
WHERE lastname LIKE N'[^A-E]%';


