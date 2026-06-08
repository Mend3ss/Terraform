output "vm_public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "IP público do servidor Linux para realização dos testes de ataque."
}

output "log_analytics_workspace_id" {
  value       = azurerm_log_analytics_workspace.law.workspace_id
  description = "ID do Workspace do Log Analytics criado para o Sentinel."
}