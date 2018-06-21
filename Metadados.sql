USE TSQLFundamentals2008;
/*A fun��o SCHEMA_NAME � usada para converter o n�mero inteiro do identificador do 
*esquema.
*/
SELECT SCHEMA_NAME(schema_id) AS table_schema_name, name As Nome_Tabela
FROM sys.tables;
/*Para obter informa��es sobre colunas em uma tabela , voc� pode consultart a tabela sys.columns
*/

SELECT 
    name AS Nome_Coluna,
	TYPE_NAME(system_type_id) AS Tipo_coluna,
	max_length, 
	collation_name, 
	is_nullable
FROM sys.columns
WHERE object_id = OBJECT_ID(N'Sales.orders');

--VIEWS DE ESQUEMAS DE INFORMA��ES
SELECT  
     TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = N'BASE TABLE'

USE TSQLFundamentals2008;
SELECT
       COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, COLLATION_NAME, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = N'Sales'
AND   TABLE_NAME = N'Orders';


--FUN�OES E PROCEDIMENTOS ARMAZENADOS (STORED PROCEDURES) DO SISTEMA
/*O procedimento armazenado sp_tables retorna uma lista de objetos(como tabelas, views)  
*que podem ser consultados no banco de dados atual
*/
EXEC sys.sp_tables

/*O Procedimento sys.sp_help aceita um nome de objeto como parametro e retorna  v�rios conjuntos 
*de resultados com informa�oes gerais sobre o objeto e tamb�m informa�oes sobre colunas, indices, constrints
*e muito mais.
*/
EXEC sys.sp_help
@objname = N'Sales.Orders';

/*Retorna informa��es sobre colunas em um objeto.
*/
EXEC sys.sp_columns
 @table_name = N'Orders', 
 @table_owner = N'Sales';

 /*O procedimento sp_helpconstraint retorna informa�oes sobre contraint de um objeto
 */
 EXEC sys.sp_helpconstraint 
 @objname = N'Sales.Orders';

 --FUN��O
 /* SERVERPROPERTY retorna a propriedade solicitada da inst6ancia atual.
 */
 SELECT
       SERVERPROPERTY('ProductLevel');

/*Retorna o collation do banco de dados 
*/
SELECT  
     DATABASEPROPERTYEX(N'TSQLFundamentals2008', 'Collation');

/*retorna a propriedade solicitada no nome do objeto dado
*/
SELECT 
      OBJECTPROPERTY(OBJECT_ID(N'Sales.Orders'), 'TableHasprimaryKey');

/*
* A fun��o COLUMNPROPERTY retorna a propriedade solicitada de uma coluna dada
*/

SELECT 
COLUMNPROPERTY(OBJECT_ID(N'Sales.Orders'), N'shipcountry', 'allowsnull'); 





 
       


