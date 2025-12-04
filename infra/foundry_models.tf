resource "azapi_resource" "chat_model_deployment" {
  type      = "Microsoft.CognitiveServices/accounts/deployments@2025-04-01-preview"
  name      = "chatmodel"
  parent_id = azapi_resource.foundry.id
  tags      = local.tags_azapi
  body = {
    properties = {
      currentCapacity = 50
      model = {
        format  = "OpenAI"
        name    = "gpt-4.1"
        version = "2025-04-14"
      }
      raiPolicyName = "Microsoft.DefaultV2"
    }
    sku = {
      capacity = 50
      name     = "GlobalStandard"
    }
  }
}

resource "azapi_resource" "embedding_model_deployment" {
  type      = "Microsoft.CognitiveServices/accounts/deployments@2025-04-01-preview"
  name      = "embeddingmodel"
  parent_id = azapi_resource.foundry.id
  tags      = local.tags_azapi
  body = {
    properties = {
      currentCapacity = 100
      model = {
        format  = "OpenAI"
        name    = "text-embedding-3-small"
        version = "1"
      }
      raiPolicyName = "Microsoft.DefaultV2"
    }
    sku = {
      capacity = 50
      name     = "GlobalStandard"
    }
  }
  depends_on = [
    azapi_resource.chat_model_deployment
  ]
}
