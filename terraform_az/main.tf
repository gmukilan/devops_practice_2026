module "network" {
  source = "../modules/network"
  resource_group_name = var.resource_group_name
  location = var.location
  vnet_name = "muruga.web"
  subnets = {
    "app" = "10.0.1.0/24"
    "web" = "10.0.2.0/24"
    "dev" = "10.0.3.0/24"
    "test" = "10.0.4.0/24"
  }
}