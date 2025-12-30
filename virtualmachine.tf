resource "azurerm_network_interface" "vm_nic01" {
  name                = "nic_vm_win"
  location            = azurerm_resource_group.rg_hml.location
  resource_group_name = azurerm_resource_group.rg_hml.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sub_srv01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm_pip_win.id
  }
}

resource "azurerm_public_ip" "vm_pip_win" {
  name                = "pip_vm_win"
  resource_group_name = azurerm_resource_group.rg_hml.name
  location            = azurerm_resource_group.rg_hml.location
  sku                 = "Standard"
  allocation_method   = "Static"
  ip_version          = "IPv4"

}

resource "azurerm_windows_virtual_machine" "vm-win" {
  name                = "vm-win01"
  resource_group_name = azurerm_resource_group.rg_hml.name
  location            = azurerm_resource_group.rg_hml.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.vm_nic01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "vm_lnx_nic01" {
  name                = "nic_vm_lnx"
  location            = azurerm_resource_group.rg_hml.location
  resource_group_name = azurerm_resource_group.rg_hml.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sub_srv02.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-lnx" {
  name                = "vm-lnx01"
  resource_group_name = azurerm_resource_group.rg_hml.name
  location            = azurerm_resource_group.rg_hml.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm_lnx_nic01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}