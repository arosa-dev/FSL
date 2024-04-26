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


resource "azurerm_resource_group" "fsl_rg" {
  location = "eastus"
  name     = "fslGroup1"
}


resource "azurerm_storage_account" "fsl_sa" {
  resource_group_name = azurerm_resource_group.fsl_rg.name
  location            = azurerm_resource_group.fsl_rg.location

  name = "fslsa1"

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}


resource "azurerm_storage_blob" "example" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.fsl_sa.name
  storage_container_name = "$web"
  type                   = "Block"
}