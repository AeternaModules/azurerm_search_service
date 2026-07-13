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
    customer_managed_key_enforcement_enabled = optional(bool)
    hosting_mode                             = optional(string)
    local_authentication_enabled             = optional(bool)
    network_rule_bypass_option               = optional(string)
    partition_count                          = optional(number)
    public_network_access_enabled            = optional(bool)
    replica_count                            = optional(number)
    semantic_search_sku                      = optional(string)
    tags                                     = optional(map(string))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.search_services : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.search_services : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.search_services : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.search_services : (
        v.replica_count == null || (v.replica_count >= 1 && v.replica_count <= 12)
      )
    ])
    error_message = "must be between 1 and 12"
  }
  validation {
    condition = alltrue([
      for k, v in var.search_services : (
        v.partition_count == null || (contains([1, 2, 3, 4, 6, 12], v.partition_count))
      )
    ])
    error_message = "must be one of: 1, 2, 3, 4, 6, 12"
  }
  validation {
    condition = alltrue([
      for k, v in var.search_services : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 14 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

