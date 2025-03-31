# progress-visualiser-sql
An SQL Server repository to store data related to the [progress-visualiser-api](https://github.com/yalshaeyr/progress-visualiser-api) repo.

## Deployment Requirements
1. Create a [Microsoft Entra Service Principal](https://github.com/Azure/sql-action/blob/master/CONNECTION.md#create-a-service-principal) with the Azure CLI command below, replacing `<name>`
```cmd
az ad sp create-for-rbac --name "<name>"
```
2. Set database permissions for the Service Principal:
```SQL
-- sp-pv-test is <name> in step #1
CREATE USER [sp-pv-test] FROM EXTERNAL PROVIDER;

-- Need VIEW DEFINITION + ALTER DATABASE role, so db_ddladmin nor db_securityadmin is sufficient
-- See https://learn.microsoft.com/en-us/sql/relational-databases/security/authentication-access/database-level-roles?view=sql-server-ver16
ALTER ROLE [db_owner]
ADD MEMBER [sp-pv-test];
```
3. Configure a GitHub Environment corresponding to your desired environments (e.g. DEV, TEST and PROD)
   - *Please note that repository-level secrets need to be set for when the GitHub Actions pipeline is triggered with no environment selected*
4. Configure GitHub Secret
- **AZURE_SQL_CONNECTION_STRING**: The connection string used to connect to the Azure SQL Database, which will be in the form below. Note that `user_id` is the `appId` returned by the command in Step #1. In other words, this is the Application (Client) ID of the Service Principal created.
```
Server=<servername>;Initial Catalog=<database>;Authentication=Active Directory Service Principal; User ID=<user_id>; Password=<password>; Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
```

See [Azure Active Directory service principal authentication](https://github.com/Azure/sql-action/blob/master/CONNECTION.md#azure-active-directory-service-principal-authentication) for a more detailed description of this process.