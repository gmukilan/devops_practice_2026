output "rg_name" {
  value = azurerm_resource_group.myrg.name
}

output "rg_location" {
  value = azurerm_resource_group.myrg.location
}

output "vnet_id" {
  value = azurerm_virtual_network.myvg.id
}

output "subnet_ids" {
  value = { for k, s in azurerm_subnet.mysub : k => s.id }
}