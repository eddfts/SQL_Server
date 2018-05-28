use testedb;
ALTER TABLE dbo.Employees
ADD CONSTRAINT PK_Employess 
PRIMARY KEY(empid);


ALTER TABLE dbo.Employees 
ADD CONSTRAINT UNQ_Employees_ssn
UNIQUE(ssn);

ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Employees_Employess
FOREIGN KEY(mgrid)
REFERENCES Employees(empid);



