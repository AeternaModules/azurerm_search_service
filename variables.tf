variable "search_services" {
  description = <<EOT
Map of search_services, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - allowed_ips
    - authentication_failure_mode
    - customer_managed_key_enforcement_enabled
    - hosting_mode
    - local_authentication_enabled
    - network_rule_bypass_option
    - partition_count
    - public_network_access_enabled
    - replica_count
    - semantic_search_sku
    - tags
    - identity (block):
        - identity_ids (optional)
        - type (required)
EOT

  type = map(object({
    location                                 = string
    name                                     = string
    resource_group_name                      = string
    sku                                      = string
    allowed_ips                              = optional(set(string))
    authentication_failure_mode              = optional(string)
    customer_managed_key_enforcement_enabled = optional(bool, false)
    hosting_mode                             = optional(string, "Default")
    local_authentication_enabled             = optional(bool, true)
    network_rule_bypass_option               = optional(string, "None")
    partition_count                          = optional(number, 1)
    public_network_access_enabled            = optional(bool, true)
    replica_count                            = optional(number, 1)
    semantic_search_sku                      = optional(string)
    tags                                     = optional(map(string))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
  }))
}

