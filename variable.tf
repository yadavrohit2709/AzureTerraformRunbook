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
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "automation_account_name" {
  type = string
}

variable "automation_account_sku" {
  type = string
  default = "Basic"
}

variable "sql_server_name" {
  type = string
}

variable "sql_server_admin_login" {
  type = string
}

variable "sql_server_admin_password" {
  type = string
}

variable "sql_database_name" {
  type = string
}

variable "sql_database_edition" {
  type = string
  default = "Standard"
}

variable "sql_database_service_objective_name" {
  type = string
  default = "S0"
}

variable "automation_runbook_name" {
  type = string
}

variable "automation_schedule_name" {
  type = string
}

variable "automation_schedule_type" {
  type = string
  default = "Recurring"
}

variable "automation_schedule_interval" {
  type = int
  default = 30
}

variable "automation_schedule_start_time" {
  type = string
  default = "12:00"
}
