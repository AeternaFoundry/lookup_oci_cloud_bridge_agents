data "oci_cloud_bridge_agents" "cloud_bridge_agents_lookup" {
  for_each = var.cloud_bridge_agents_lookup

  compartment_id = each.value.compartment_id
  agent_id       = each.value.agent_id
  display_name   = each.value.display_name
  environment_id = each.value.environment_id
  state          = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

