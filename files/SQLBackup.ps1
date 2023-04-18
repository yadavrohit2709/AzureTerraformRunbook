# Set variables for the SQL database
$resourceGroupName = "PmAKS"
$serverName = "ecom-sql-server"
$databaseName = "ecom-sql-database"

# Set variables for the Azure Storage account
$storageAccountName = "tfstate012060038838"
$storageAccountKey = "mMDHZP6EDlh2PN6WnY7gnbrJrUWxFPlBM2d6C0RMAXJuYNaNqXHnS+6HWfYi30EMaVi5biDhIrW6+ASt610fjg=="
$containerName = "tfstate"

# Set variables for the backup settings
$backupName = "$databaseName-backup-" + (Get-Date -Format yyyy-MM-dd-HH-mm-ss)
$backupExpiry = (Get-Date).AddDays(7)

# Create a new backup of the SQL database
New-AzSqlDatabaseExport -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -StorageKey $storageAccountKey -StorageKeyType "StorageAccessKey" -StorageUri "https://$storageAccountName.blob.core.windows.net/$containerName/$backupName.bacpac" -AdministratorLogin "adminlogin" -AdministratorLoginPassword (ConvertTo-SecureString "Admin@789Password" -AsPlainText -Force)

# Set the expiry time for the backup
#Set-AzStorageBlobProperties -Context (New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey) -Container $containerName -Blob $backupName.bacpac -ExpiryTime $backupExpiry
