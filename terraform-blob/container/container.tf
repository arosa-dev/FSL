terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
}



resource "azurerm_storage_container" "web_container" {
  name                  = "$web"
  storage_account_name  = "fslsa1"
  container_access_type = "container"
}