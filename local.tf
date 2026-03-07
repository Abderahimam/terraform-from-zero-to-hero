locals {
  prefix = "redbull"
  region = "polandcentral"
  tags = {
    cost_center = "finance resource"
  }
}




locals {
  subnets = { for subnet in flatten([
    for virtual_network_key, virtual_network_value in var.virtual_networks : [
      for subnet_key, subnet_value in virtual_network_value.subnets : {
        composite_key        = "${virtual_network_key}-${subnet_key}"
        name                 = subnet_value.name == null ? "${virtual_network_value.name}-${subnet_key}" : subnet_value.name
        address_prefix       = subnet_value.address_prefix
        resource_group_name  = azurerm_resource_group.demo[virtual_network_value.resource_group_key].name
        virtual_network_name = azurerm_virtual_network.demo[virtual_network_key].name
      }
    ]
  ]) : subnet.composite_key => subnet }
}