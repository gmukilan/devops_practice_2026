terraform {
  backend "azurerm" {
    resource_group_name = "muruga-tfstate"
    storage_account_name = "murugatfstate5165"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}