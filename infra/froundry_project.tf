resource "azapi_resource" "project" {
  type      = "Microsoft.CognitiveServices/accounts/projects@2025-06-01"
  name      = format("proj-%s", local.resource_suffix_kebabcase)
  location  = local.resource_group_location
  parent_id = azapi_resource.foundry.id
  tags      = local.tags_azapi

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      description = "Agent Project"
      displayName = "Agent Project"
    }
  }
}
