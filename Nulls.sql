USE TSQLFundamentals2008;


SELECT custid, country, region, city
FROM Sales.Customers; 

SELECT custid, country, region, city
FROM Sales.Customers 
WHERE region = N'WA';


SELECT custid, country, region, city
FROM Sales.Customers 
WHERE region <> N'WA';


SELECT custid, country, region, city
FROM Sales.Customers
WHERE region = NULL;


SELECT custid, country, region, city
FROM Sales.Customers
WHERE region IS NULL;


SELECT custid, country, region, city
FROM Sales.Customers 
WHERE region <> N'WA'
OR region IS NULL;




