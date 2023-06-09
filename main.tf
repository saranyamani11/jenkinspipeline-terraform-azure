
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "rg-saru-001"
  location = "northeurope"

}
resource "azurerm_container_group" "cg" {
  name                = "saranyacompanies"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  #ip_address_type = "public"
  dns_name_label = "saranyadns1987" #unique name 
  os_type        = "Linux"

  container {

    name   = "saranyacompanies"
    image  = "saranyamani11/mypage-pipeline-dockerimage:3.0"
    cpu    = "1"
    memory = "1"
    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
variable "ARM_TENANT_ID" {
}
variable "ARM_SUBSCRIPTION_ID" {
}
variable "ARM_CLIENT_ID" {
}
variable "ARM_CLIENT_SECRET" {
}
