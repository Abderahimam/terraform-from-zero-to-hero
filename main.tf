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
  name  = "${var.prefix}-rg"
  location = var.region

  tags = var.tags
}
resource "azurerm_resource_group" "dev_rg" {
  name = "${var.prefix}-dev-rg"
  location = var.region
  tags = var.tags
}