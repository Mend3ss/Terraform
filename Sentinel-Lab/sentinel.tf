resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${local.prefix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                 = local.tags
}

resource "azurerm_log_analytics_solution" "sentinel" {
  solution_name         = "SecurityInsights"
  location              = azurerm_resource_group.lab.location
  resource_group_name   = azurerm_resource_group.lab.name
  workspace_resource_id = azurerm_log_analytics_workspace.law.id
  workspace_name        = azurerm_log_analytics_workspace.law.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
}

# Recurso adicionado para resolver o erro de onboarding
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel_onboarding" {
  workspace_id = azurerm_log_analytics_workspace.law.id

  depends_on = [
    azurerm_log_analytics_solution.sentinel
  ]
}