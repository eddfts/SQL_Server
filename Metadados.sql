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

