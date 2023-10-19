# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {

  features {}
  # client_id       = "ur id"
  # client_secret   = "ur secret"
  # subscription_id = "ur id"
  # tenant_id       = "ur id"
}

# Create a resource group
resource "azurerm_resource_group" "terra-demo" {
  name     = "terra-demo-rg"
  location = "Central India"
}
