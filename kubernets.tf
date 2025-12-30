# Criar um cluster Kubernetes no Azure usando o Terraform com menor recurso disponível
resource "azurerm_kubernetes_cluster" "aks-hml-01" {
    name                = "aks-hml-01"
    location            = azurerm_resource_group.rg_hml.location
    resource_group_name = azurerm_resource_group.rg_hml.name
    dns_prefix          = "akshml01"
    
    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_D2pls_v6"
    }
    
    identity {
        type = "SystemAssigned"
    }
    
    tags = {
        Environment = "HML"
    }
}