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
    customer_managed_key_enforcement_enabled = optional(bool)   # Default: false
    hosting_mode                             = optional(string) # Default: "Default"
    local_authentication_enabled             = optional(bool)   # Default: true
    network_rule_bypass_option               = optional(string) # Default: "None"
    partition_count                          = optional(number) # Default: 1
    public_network_access_enabled            = optional(bool)   # Default: true
    replica_count                            = optional(number) # Default: 1
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
        v.replica_count == null || (v.replica_count >= 1 && v.replica_count <= 12)
      )
    ])
    error_message = "must be between 1 and 12"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_search_service's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: partition_count
  #   source:    validation.IntInSlice(...) - no translation rule yet, add one
  # path: authentication_failure_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: hosting_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: semantic_search_sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: allowed_ips[*]
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: network_rule_bypass_option
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

