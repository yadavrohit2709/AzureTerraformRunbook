# Create a resource group
data "azurerm_resource_group" "ecom_rg" {
  name     = var.resource_group_name
}

# Add the "data" block to load the PowerShell script file:
data "local_file" "sql_backup" {
  filename = "files/SQLBackup.ps1"
}

# Create an Azure Automation account
resource "azurerm_automation_account" "ecomaa" {
  name                = var.automation_account_name
  location            = data.azurerm_resource_group.ecom_rg.location
  resource_group_name = data.azurerm_resource_group.ecom_rg.name
  sku                 = var.automation_account_sku
}

# Create an Azure SQL Database
resource "azurerm_sql_database" "ecomdb" {
  name                     = var.sql_database_name
  resource_group_name      = data.azurerm_resource_group.ecom_rg.name
  server_name              = var.sql_server_name
  edition                  = var.sql_database_edition
  requested_service_objective_name = var.sql_database_service_objective_name
}

# Create an Azure Automation Runbook
resource "azurerm_automation_runbook" "ecomsqlbackuprunbook" {
  name                = var.automation_runbook_name
  location            = azurerm_automation_account.ecomaa.location
  resource_group_name = azurerm_automation_account.ecomaa.resource_group_name
  automation_account_name = azurerm_automation_account.ecomaa.name
  log_verbose         = true
  log_progress        = true
  runbook_type        = "PowerShell"
  draft               = true
  content             = data.local_file.sql_backup.content
}

# Link the Azure Automation Runbook to the Azure SQL Database
resource "azurerm_automation_schedule" "sqlbakcupschedule" {
  name                = var.automation_schedule_name
  location            = azurerm_automation_account.ecomaa.location
  resource_group_name = azurerm_automation_account.ecomaa.resource_group_name
  automation_account_name = azurerm_automation_account.ecomaa.name
  runbook_name        = azurerm_automation_runbook.ecomsqlbackuprunbook.name
  schedule_type       = var.automation_schedule_type
  interval            = var.automation_schedule_interval
  start_time          = var.automation_schedule_start_time
}
