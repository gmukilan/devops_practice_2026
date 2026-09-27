resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "myvg" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "mysub" {
  for_each             = var.subnets
  virtual_network_name = azurerm_virtual_network.myvg.name
  resource_group_name  = azurerm_resource_group.myrg.name
  name                 = "muruga-${each.key}"
  address_prefixes     = [each.value]
}

resource "azurerm_network_security_group" "mynsg" {
  name = "muruga-nsg"
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  security_rule {
    name = "allow-ssh"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each =  azurerm_subnet.mysub
  subnet_id = each.value.id
  network_security_group_id = azurerm_network_security_group.mynsg.id

}

data "azurerm_client_config" "current" {}
output "current_subscription_id" {
  value = data.azurerm_client_config.current.subscription_id  
}

output "current_tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}