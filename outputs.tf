output "resource_groups_ids" {
  value       = { for key, value in azurerm_resource_group.demo : key => value.id }
  description = "resource groups ids"
}
 