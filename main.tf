terraform {
  required_version = "= 0.12.29"
}
provider "azurerm" {
  version = "=2.30.0"
  features {}
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