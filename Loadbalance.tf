#Criar um load balance

resource "azurerm_lb" "lb" {
    name                = "myLoadBalancer"
    location            = azurerm_resource_group.rg_hml.location
    resource_group_name = azurerm_resource_group.rg_hml.name

}
