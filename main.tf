terraform {
  required_version = "= 0.12.29"
}
provider "azurerm" {
  version = "=2.30.0"
  features {}

  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id

}

locals {
  header = "sans1weu"
  rsg_name = "${local.header}rsg${var.workload_acronym}comm${var.sequence_number}"
  sta_name = "${local.header}sta${var.workload_acronym}comm${var.sequence_number}"
  akv_name = "${local.header}sta${var.workload_acronym}comm${var.sequence_number}"
}

resource "azurerm_resource_group" "rsg" {
  name     = local.rsg_name
  location = var.location

  tags = {
    cost_center     = var.cost_center
    product         = var.product
    cia             = var.cia
  }
}

resource "azurerm_key_vault" "akv" {
  location = var.location
  name = local.akv_name
  resource_group_name = azurerm_resource_group.rsg.name
  sku_name = "premium"
  tenant_id = var.tenant_id

  tags = {
    cost_center     = azurerm_resource_group.rsg.tags["cost_center"]
    product         = azurerm_resource_group.rsg.tags["product"]
    channel         = var.channel
    description     = var.description
    tracking_code   = var.tracking_code
    cia             = var.cia
  }

  depends_on = [azurerm_resource_group.rsg]
}

resource "azurerm_storage_account" "sta" {
  name                      = local.sta_name
  resource_group_name       = azurerm_resource_group.rsg.name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Premium"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  blob_properties{
    delete_retention_policy {
      days = var.delete_retention_days
    }
  }

  tags = {
    cost_center     = azurerm_resource_group.rsg.tags["cost_center"]
    product         = azurerm_resource_group.rsg.tags["product"]
    channel       = var.channel
    description   = var.description
    tracking_code = var.tracking_code
    cia           = var.cia
  }

  depends_on = [azurerm_resource_group.rsg]
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = local.sta_name
  container_access_type = "private"

  depends_on = [azurerm_storage_account.sta]
}
