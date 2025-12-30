data "azurerm_subnet" "sub_srv01" {
  name                 = "sub-srv01"
  virtual_network_name = azurerm_virtual_network.vnet_hml01.name
  resource_group_name  = azurerm_resource_group.rg_hml.name
}

data "azurerm_subnet" "sub_srv02" {
  name                 = "sub-srv02"
  virtual_network_name = azurerm_virtual_network.vnet_hml01.name
  resource_group_name  = azurerm_resource_group.rg_hml.name
}