use testedb;
if OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
drop table  dbo.Employees;
CREATE TABLE dbo.employees 
( empid INT NOT NULL,
  firstname VARCHAR(30) NOT NULL,  
  hiredate DATE NOT NULL,
  mgrid INT NULL,
  ssn VARCHAR(20) NOT NULL,
  salary MONEY NOT NULL  
); 
