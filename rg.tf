# Create a resource group
resource "azurerm_resource_group" "rg_hml" {
  name     = "rg_hml01"
  location = "West Europe"
}