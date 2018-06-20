USE TSQLFundamentals2008;
/*A função SCHEMA_NAME é usada para converter o número inteiro do identificador do 
*esquema.
*/
SELECT SCHEMA_NAME(schema_id) AS table_schema_name, name As Nome_Tabela
FROM sys.tables;
/*Para obter informações sobre colunas em uma tabela , você pode consultart a tabela sys.columns
*/

SELECT 
    name AS Nome_Coluna,
	TYPE_NAME(system_type_id) AS Tipo_coluna,
	max_length, 
	collation_name, 
	is_nullable
FROM sys.columns
WHERE object_id = OBJECT_ID(N'Sales.orders');

