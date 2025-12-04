resource "azapi_resource" "foundry" {
  type      = "Microsoft.CognitiveServices/accounts@2025-06-01"
  name      = format("aif-%s", local.resource_suffix_kebabcase)
  parent_id = local.resource_group_id
  location  = local.resource_group_location
  tags      = local.tags_azapi

  body = {
    kind = "AIServices"
    identity = {
      type = "SystemAssigned"
    }

    properties = {
      allowProjectManagement = true
      publicNetworkAccess    = "Enabled"
      disableLocalAuth       = true
      customSubDomainName    = format("aif-%s", local.resource_suffix_kebabcase)
    }
    sku = {
      name = "S0"
    }
  }
  response_export_values = ["*"]
}

moved {
  from = azapi_resource.ai_services
  to   = azapi_resource.foundry
}
