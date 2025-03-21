# progress-visualiser-sql
An SQL Server repository to store data related to the [progress-visualiser-api](https://github.com/yalshaeyr/progress-visualiser-api) repo.

## Deployment Requirements
1. Create a [Microsoft Entra Application Registration](https://learn.microsoft.com/en-us/entra/identity-platform/howto-create-service-principal-portal#register-an-application-with-microsoft-entra-id-and-create-a-service-principal)
2. Configure a [Federated Identity Credential](https://learn.microsoft.com/en-us/azure/azure-sql/database/connect-github-actions-sql-db?view=azuresql&tabs=openid#generate-deployment-credentials) on this Application Registration
3. In your deployment target (Azure SQL Database), assign the SQL Server Contributor role to the created Application Registration.
- Skipping this step will result in a "No subscriptions found for ***." error during the initial stages of the pipeline.
4. Set database permissions
```SQL
CREATE USER [app-pv-test] FROM EXTERNAL PROVIDER;

ALTER ROLE [db_ddladmin]
ADD MEMBER [app-pv-test];

-- After initial deployment (as prior to this, these tables do not exist)
GRANT SELECT, DELETE, INSERT, ALTER, UPDATE ON [PV].[Metrics] TO [app-pv-test]
GRANT SELECT, DELETE, INSERT, ALTER, UPDATE ON [PV].[MetricData] TO [app-pv-test]
GRANT SELECT, DELETE, INSERT, ALTER, UPDATE ON [PV].[Users] TO [app-pv-test]
```
5. Configure a GitHub Environment corresponding to your desired environments (e.g. DEV, TEST and PROD)
   - *Please note that repository-level secrets need to be set for when the GitHub Actions pipeline is triggered with no environment selected*
6. Configure GitHub Secrets
- **AZURE_CLIENT_ID**:	Application Registration's Client ID (from Step #1)
- **AZURE_SUBSCRIPTION_ID**:	Application Registration's Subscription ID (from Step #1)
- **AZURE_TENANT_ID**:	Application Registration's Tenant ID (from Step #1)
- **AZURE_SQL_CONNECTION_STRING**: Which is in the form `Server=tcp:<server-name>.database.windows.net,1433;Initial Catalog=<database-name>;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;Authentication=Active Directory Default;`

See [Azure Active Directory managed identity authentication](https://github.com/Azure/sql-action/blob/master/CONNECTION.md#azure-active-directory-managed-identity-authentication) for a more detailed description of this process.