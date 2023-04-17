variable "BKSTRGRG" {
  type        = string
  description = "The name of the backend storage account resource group"
}

variable "BKSTRG" {
  type        = string
  description = "The name of the backend storage account"
}

variable "BKCONTAINER" {
  type = string
  description = "The container name for the backend config"
}

variable "BKSTREGKEY" {
  type = string
  description = "The access key for the storage account"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create"
}

variable "automation_account_name" {
  type        = string
  description = "Name of the Azure Automation account to create"
}

variable "automation_account_sku" {
  type        = string
  description = "SKU of the Azure Automation account"
  default     = "Basic"
}

variable "sql_database_name" {
  type        = string
  description = "Name of the Azure SQL database to create"
}

variable "sql_server_name" {
  type        = string
  description = "Name of the Azure SQL server"
}

variable "sql_database_edition" {
  type        = string
  description = "Edition of the Azure SQL database"
  default     = "Basic"
}

variable "sql_database_service_objective_name" {
  type        = string
  description = "Service objective of the Azure SQL database"
  default     = "Basic"
}

variable "automation_runbook_name" {
  type        = string
  description = "Name of the Azure Automation runbook to create"
}

variable "automation_schedule_name" {
  type        = string
  description = "Name of the Azure Automation schedule to
