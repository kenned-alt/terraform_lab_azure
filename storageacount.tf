resource "azurerm_storage_account" "stg_lab_hml" {
  name                     = "blobstorageveeamhml"
  resource_group_name      = azurerm_resource_group.rg_hml.name
  location                 = azurerm_resource_group.rg_hml.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "share_hml" {
  name                 = "fileshare01"
  storage_account_name = azurerm_storage_account.stg_lab_hml.name
  quota                = 50

}