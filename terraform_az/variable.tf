variable "resource_group_name" {
  description = "Name of the RG"
  type        = string
  default     = "muruga"

}
variable "location" {
  description = "Name of the region"
  type        = string
  default     = "eastus"
}

variable "subnets" {
  description = "value of subnets"
  type        = map(string)
  default = {
    "app"  = "10.0.1.0/24"
    "web"  = "10.0.2.0/24"
    "dev"  = "10.0.3.0/24"
  }

}