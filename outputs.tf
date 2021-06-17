output "rsg_name" {
  value = azurerm_resource_group.rsg.name
}

output "rsg_id" {
  value = azurerm_resource_group.rsg.id
}

output "kvt_name"{
  value = azurerm_key_vault.akv.name
}

output "kvt_id"{
  value = azurerm_key_vault.akv.id
}

output "storage_account_id" {
  value = azurerm_storage_account.sta.id
}

output "storage_account_name" {
  value = azurerm_storage_account.sta.name
}
