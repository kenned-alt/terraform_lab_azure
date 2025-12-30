# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = "e2192c0d-e4d5-4cb3-9241-bb1e1e771426"
  tenant_id = "c1f17d5e-f231-4f63-81a1-966179fc6eca"
}