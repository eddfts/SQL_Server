USE  TSQLFundamentals2008;

SELECT name, description
FROM sys.fn_helpcollations();

SELECT empid,firstname, lastname
FROM HR.Employees
WHERE lastname = N'davis';


SELECT empid,firstname, lastname
FROM HR.Employees
WHERE lastname COLLATE  Latin1_General_CS_AS  = N'davis';



