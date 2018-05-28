use testedb;
ALTER TABLE dbo.Employees
ADD CONSTRAINT PK_Employess 
PRIMARY KEY(empid);


ALTER TABLE dbo.Employees 
ADD CONSTRAINT UNQ_Employees_ssn
UNIQUE(ssn);




