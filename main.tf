terraform {
  required_version = "= 0.13.5"
}
provider "azurerm" {
  version = "=2.30.0"
  features {}

  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id

}
resource "azurerm_resource_group" "rsg" {
  name     = var.name
  location = var.location

  tags = {
    cost_center     = var.cost_center
    product         = var.product
    cia             = var.cia

  }
}
