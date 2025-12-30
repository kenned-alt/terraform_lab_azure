resource "azurerm_network_security_group" "nsg_hml01" {
  name                = "nsg01"
  location            = azurerm_resource_group.rg_hml.location
  resource_group_name = azurerm_resource_group.rg_hml.name
}

resource "azurerm_network_security_rule" "nsg_rule_rdp" {
  name                        = "AllowRDP"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = azurerm_network_interface.vm_nic01.private_ip_address
  resource_group_name         = azurerm_resource_group.rg_hml.name
  network_security_group_name = azurerm_network_security_group.nsg_hml01.name
}

resource "azurerm_network_security_rule" "nsg_rule_http" {
  name                        = "AllowHTTP"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = azurerm_network_interface.vm_nic01.private_ip_address
  resource_group_name         = azurerm_resource_group.rg_hml.name
  network_security_group_name = azurerm_network_security_group.nsg_hml01.name
}

resource "azurerm_network_security_rule" "nsg_rule_ssh" {
  name                        = "AllowSSH"
  priority                    = 302
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = azurerm_network_interface.vm_lnx_nic01.private_ip_address
  resource_group_name         = azurerm_resource_group.rg_hml.name
  network_security_group_name = azurerm_network_security_group.nsg_hml01.name
}