terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.62.0"
    }
  }
}

provider "azurerm" {
  features {}

}
   
resource "azurerm_resource_group" "redbull_rg" {
  name  = "${local.prefix}-rg"
  location = local.region

  tags = local.tags
}
resource "azurerm_resource_group" "dev_rg" {
  name = "${local.prefix}-dev-rg"
  location = local.region
  tags = local.tags
}