USE testedb;

ALTER TABLE dbo.Orders
ADD CONSTRAINT DFT_Orders_orderts
DEFAULT(CURRENT_TIMESTAMP) FOR orderts;