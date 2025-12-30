# Criar backend para o Terraform usando o Azure Blob Storage
terraform {
  backend "azurerm" {
    resource_group_name   = "lab-terraform-rg-backend"
    storage_account_name  = "stgbstate2025"
    container_name        = "tfstate"
    key                   = "key-terraform.tfstate"
  }
}