USE TSQLFundamentals2008;
SELECT productid, productname, categoryid, 
       CASE categoryid 
		   WHEN 1 THEN 'Beverages'
		   WHEN 2 THEN 'Condiments'
		   WHEN 3 THEN 'Confections'
		   WHEN 4 THEN 'Dairy Products'
		   WHEN 5 THEN 'Grains/Cereals'
		   WHEN 6 THEN 'Meat/Poutry'
		   WHEN 7 THEN 'Produce'
		   WHEN 8 THEN 'Seafood'
	       ELSE 'Categoria Desconhecida'
	   END AS CategoriaNome
FROM Production.Products; 

SELECT orderid, custid, val,NTILE(3) OVER(ORDER BY val)
FROM Sales.OrderValues


SELECT orderid, custid, val,
       CASE  NTILE(3) OVER(ORDER BY val)
	   WHEN 1 THEN 'Low'
	   WHEN 2 THEN 'Medium'
	   WHEN 3 THEN 'High'
	   ELSE 'Unknowm'
	   END AS titleDesc 
FROM Sales.OrderValues
