output "storage_accounts_ids" {
  description = "The IDs of the Storage Accounts"
  value       = { for sa_name, stg in azurerm_storage_account.stgs: sa_name => stg.id }   
  
}