storage_accounts = {
  "stgaccount1" = {
    name                     = "dronestg1"
    resource_group_name      = "drone-rg"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    is_hns_enabled           = true
  },
  "stgaccount2" = {
    name                     = "dronestg2"
    resource_group_name      = "dev-rg-back"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}