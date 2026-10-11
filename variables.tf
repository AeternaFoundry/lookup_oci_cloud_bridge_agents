variable "cloud_bridge_agents_lookup" {
  description = <<EOT
Map of cloud_bridge_agents_lookup, attributes below
Required:
    - compartment_id
Optional:
    - agent_id
    - display_name
    - environment_id
    - state
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id = string
    agent_id       = optional(string)
    display_name   = optional(string)
    environment_id = optional(string)
    state          = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

