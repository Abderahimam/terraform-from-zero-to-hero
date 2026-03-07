


resource "azurerm_resource_group" "demo" {
  for_each = var.resource_groups
  name     = "${var.prefix}_${each.value}"
  location = var.region

  tags = var.tags
}


resource "azurerm_virtual_network" "demo" {
  for_each = var.virtual_networks
  name = each.value.name
  address_space = each.value.address_space
  location = var.region
  resource_group_name = azurerm_resource_group.demo[each.value.resource_group_key].name
}
resource "azurerm_subnet" "demo" {
  for_each = local.subnets
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = [each.value.address_prefix]
}