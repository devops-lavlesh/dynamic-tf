
variable "storage_accounts" {
  type = map(object({
    name                             = string
    resource_group_name              = string
    location                         = string
    account_tier                     = string
    account_replication_type         = string
    account_kind                     = optional(string)
    cross_tenant_replication_enabled = optional(bool, false)
    public_network_access_enabled    = optional(bool, false)
    is_hns_enabled                   = optional(bool, false)
    nfsv3_enabled                    = optional(bool, false)
    allow_nested_items_to_be_public  = optional(bool, false)
    default_to_oauth_authentication  = optional(bool, false)
    shared_access_key_enabled        = optional(bool, true)
    min_tls_version                  = optional(string, "TLS1_2")
    access_tier                      = optional(string, "Hot")
    https_traffic_only_enabled       = optional(bool, true)
    network_rules = optional(object({
      default_action = string
      bypass         = optional(list(string))
      ip_rules       = optional(list(string), [])
    }))
  }))
}

resource "azurerm_storage_account" "stgs" {
  for_each = var.storage_accounts

  # This is the optional block argument which also conatins optional arguments like private_link_access etc.
  dynamic "network_rules" {
    for_each = each.value.network_rules == null ? [] : [each.value.network_rules]
    content {
      default_action = network_rules.value.default_action
      bypass         = lookup(network_rules.value, "bypass", null)
      ip_rules       = lookup(network_rules.value, "ip_rules", null)
    }
  }

  #   below are the simple required and optional arguments
  name                             = each.value.name
  resource_group_name              = each.value.resource_group_name
  location                         = each.value.location
  account_tier                     = each.value.account_tier
  account_kind                     = each.value.account_kind
  cross_tenant_replication_enabled = each.value.cross_tenant_replication_enabled
  account_replication_type         = each.value.account_replication_type
  public_network_access_enabled    = each.value.public_network_access_enabled
  is_hns_enabled                   = each.value.is_hns_enabled
  nfsv3_enabled                    = each.value.nfsv3_enabled
  allow_nested_items_to_be_public  = each.value.allow_nested_items_to_be_public
  default_to_oauth_authentication  = each.value.default_to_oauth_authentication
  shared_access_key_enabled        = each.value.shared_access_key_enabled
  min_tls_version                  = each.value.min_tls_version
  access_tier                      = each.value.access_tier
  https_traffic_only_enabled       = each.value.shared_access_key_enabled
  tags                             = local.common_tags
}
locals {
  common_tags = {
    ManagedBy   = "Terraform"
    owner       = "Lavlesh"
    project     = "Small-infra"
    environment = "Dev"
    costcentre  = "CC2331"
    team        = "devops"
  }
}
