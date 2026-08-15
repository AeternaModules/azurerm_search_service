output "search_services_id" {
  description = "Map of id values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "search_services_allowed_ips" {
  description = "Map of allowed_ips values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.allowed_ips if v.allowed_ips != null && length(v.allowed_ips) > 0 }
}
output "search_services_authentication_failure_mode" {
  description = "Map of authentication_failure_mode values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.authentication_failure_mode if v.authentication_failure_mode != null && length(v.authentication_failure_mode) > 0 }
}
output "search_services_customer_managed_key_encryption_compliance_status" {
  description = "Map of customer_managed_key_encryption_compliance_status values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.customer_managed_key_encryption_compliance_status if v.customer_managed_key_encryption_compliance_status != null && length(v.customer_managed_key_encryption_compliance_status) > 0 }
}
output "search_services_customer_managed_key_enforcement_enabled" {
  description = "Map of customer_managed_key_enforcement_enabled values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.customer_managed_key_enforcement_enabled if v.customer_managed_key_enforcement_enabled != null }
}
output "search_services_endpoint" {
  description = "Map of endpoint values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.endpoint if v.endpoint != null && length(v.endpoint) > 0 }
}
output "search_services_hosting_mode" {
  description = "Map of hosting_mode values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.hosting_mode if v.hosting_mode != null && length(v.hosting_mode) > 0 }
}
output "search_services_identity" {
  description = "Map of identity values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => one(v.identity) if v.identity != null && length(v.identity) > 0 }
}
output "search_services_local_authentication_enabled" {
  description = "Map of local_authentication_enabled values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.local_authentication_enabled if v.local_authentication_enabled != null }
}
output "search_services_location" {
  description = "Map of location values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.location if v.location != null && length(v.location) > 0 }
}
output "search_services_name" {
  description = "Map of name values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.name if v.name != null && length(v.name) > 0 }
}
output "search_services_network_rule_bypass_option" {
  description = "Map of network_rule_bypass_option values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.network_rule_bypass_option if v.network_rule_bypass_option != null && length(v.network_rule_bypass_option) > 0 }
}
output "search_services_partition_count" {
  description = "Map of partition_count values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.partition_count if v.partition_count != null }
}
output "search_services_primary_key" {
  description = "Map of primary_key values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.primary_key if v.primary_key != null && length(v.primary_key) > 0 }
  sensitive   = true
}
output "search_services_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "search_services_query_keys" {
  description = "Map of query_keys values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.query_keys if v.query_keys != null && length(v.query_keys) > 0 }
}
output "search_services_replica_count" {
  description = "Map of replica_count values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.replica_count if v.replica_count != null }
}
output "search_services_resource_group_name" {
  description = "Map of resource_group_name values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "search_services_secondary_key" {
  description = "Map of secondary_key values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.secondary_key if v.secondary_key != null && length(v.secondary_key) > 0 }
  sensitive   = true
}
output "search_services_semantic_search_sku" {
  description = "Map of semantic_search_sku values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.semantic_search_sku if v.semantic_search_sku != null && length(v.semantic_search_sku) > 0 }
}
output "search_services_sku" {
  description = "Map of sku values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "search_services_tags" {
  description = "Map of tags values across all search_services, keyed the same as var.search_services"
  value       = { for k, v in azurerm_search_service.search_services : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

