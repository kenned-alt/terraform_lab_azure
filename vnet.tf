resource "azurerm_virtual_network" "vnet_hml01" {
  name                = "vnet_hml"
  location            = azurerm_resource_group.rg_hml.location
  resource_group_name = azurerm_resource_group.rg_hml.name
  address_space       = ["10.0.0.0/16"]
  
  subnet {
    name             = "sub-srv01"
    address_prefixes = ["10.0.1.0/24"]
    security_group   = azurerm_network_security_group.nsg_hml01.id
  }

  subnet {
    name             = "sub-srv02"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.nsg_hml01.id
  }
    
    tags = {
    environment = "hml"
  }
}