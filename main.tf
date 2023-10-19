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
  # client_id       = "cd15e80a-d21a-4b03-a0a1-e50d3a94480f"
  # client_secret   = "Wbu8Q~3AIw2bh8RrBwgbN1yjwGjO41OSDnh4LcVL"
  # subscription_id = "77eac2a6-e515-4813-86c3-ecc73e69e30b"
  # tenant_id       = "9806040c-fb47-45be-b7a1-ff9cf2d0b218"
}

# Create a resource group
resource "azurerm_resource_group" "terra-demo" {
  name     = "terra-demo-rg"
  location = "Central India"
}