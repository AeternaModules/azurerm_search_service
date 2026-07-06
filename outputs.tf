output "search_services" {
  description = "All search_service resources"
  value       = azurerm_search_service.search_services
  sensitive   = true
}
output "search_services_allowed_ips" {
  description = "List of allowed_ips values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.allowed_ips]
}
output "search_services_authentication_failure_mode" {
  description = "List of authentication_failure_mode values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.authentication_failure_mode]
}
output "search_services_customer_managed_key_encryption_compliance_status" {
  description = "List of customer_managed_key_encryption_compliance_status values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.customer_managed_key_encryption_compliance_status]
}
output "search_services_customer_managed_key_enforcement_enabled" {
  description = "List of customer_managed_key_enforcement_enabled values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.customer_managed_key_enforcement_enabled]
}
output "search_services_endpoint" {
  description = "List of endpoint values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.endpoint]
}
output "search_services_hosting_mode" {
  description = "List of hosting_mode values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.hosting_mode]
}
output "search_services_identity" {
  description = "List of identity values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.identity]
}
output "search_services_local_authentication_enabled" {
  description = "List of local_authentication_enabled values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.local_authentication_enabled]
}
output "search_services_location" {
  description = "List of location values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.location]
}
output "search_services_name" {
  description = "List of name values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.name]
}
output "search_services_network_rule_bypass_option" {
  description = "List of network_rule_bypass_option values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.network_rule_bypass_option]
}
output "search_services_partition_count" {
  description = "List of partition_count values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.partition_count]
}
output "search_services_primary_key" {
  description = "List of primary_key values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.primary_key]
  sensitive   = true
}
output "search_services_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.public_network_access_enabled]
}
output "search_services_query_keys" {
  description = "List of query_keys values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.query_keys]
}
output "search_services_replica_count" {
  description = "List of replica_count values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.replica_count]
}
output "search_services_resource_group_name" {
  description = "List of resource_group_name values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.resource_group_name]
}
output "search_services_secondary_key" {
  description = "List of secondary_key values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.secondary_key]
  sensitive   = true
}
output "search_services_semantic_search_sku" {
  description = "List of semantic_search_sku values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.semantic_search_sku]
}
output "search_services_sku" {
  description = "List of sku values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.sku]
}
output "search_services_tags" {
  description = "List of tags values across all search_services"
  value       = [for k, v in azurerm_search_service.search_services : v.tags]
}

