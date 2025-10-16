output "resource_group_ids" {
  description = "List of all created Resource Group IDs"
  value = {
    for key, rg in azurerm_resource_group.rgs :
    key => rg.id
  }
}