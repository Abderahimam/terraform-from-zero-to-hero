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
   
resource "azurerm_resource_group" "financegrp" {
  name  = "financegrp"
  location = "polandcentral"

  tags = {
    cost_center = "finance resource"
  }
}