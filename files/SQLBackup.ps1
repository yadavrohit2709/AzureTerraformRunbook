# Set variables for the SQL database
$resourceGroupName = "<ResourceGroupName>"
$serverName = "<ServerName>"
$databaseName = "<DatabaseName>"

# Set variables for the Azure Storage account
$storageAccountName = "<StorageAccountName>"
$storageAccountKey = "<StorageAccountKey>"
$containerName = "<ContainerName>"

# Set variables for the backup settings
$backupName = "$databaseName-backup-" + (Get-Date -Format yyyy-MM-dd-HH-mm-ss)
$backupExpiry = (Get-Date).AddDays(7)

# Create a new backup of the SQL database
New-AzSqlDatabaseExport -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName -StorageKey $storageAccountKey -StorageKeyType "StorageAccessKey" -StorageUri "https://$storageAccountName.blob.core.windows.net/$containerName/$backupName.bacpac" -AdministratorLogin "adminlogin" -AdministratorLoginPassword (ConvertTo-SecureString "password" -AsPlainText -Force)

# Set the expiry time for the backup
Set-AzStorageBlobProperties -Context (New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey) -Container $containerName -Blob $backupName.bacpac -ExpiryTime $backupExpiry
