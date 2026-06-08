resource "azurerm_sentinel_alert_rule_scheduled" "ssh_bruteforce" {
  name                       = "Linux-SSH-Possible-Brute-Force"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  display_name               = "Ambiente Lab - Tentativa de Força Bruta SSH"
  severity                   = "Medium"
  description                = "Detecta multiplas falhas de login seguidas via SSH vindas do mesmo IP de origem."

  query = <<QUERY
Syslog
| where Facility == "auth" and ProcessName == "sshd"
| where SyslogMessage has "Failed password"
| extend SourceIP = extract(@"from ([0-9.]+)", 1, SyslogMessage)
| summarize RealizadoEm = min(TimeGenerated), Falhas = count() by Computer, SourceIP
| where Falhas > 10
QUERY

  query_frequency   = "PT10M"
  query_period      = "PT10M"
  trigger_operator  = "GreaterThan"
  trigger_threshold = 0

  entity_mapping {
    entity_type = "IP"
    field_mapping {
      identifier  = "Address"
      column_name = "SourceIP"
    }
  }

  entity_mapping {
    entity_type = "Host"
    field_mapping {
      identifier  = "HostName"
      column_name = "Computer"
    }
  }

  alert_rule_template_guid = null
  enabled                  = true
  suppression_duration     = "PT5H"
  suppression_enabled      = false

  # Dependência corrigida para aguardar o processo de onboarding terminar
  depends_on = [
    azurerm_sentinel_log_analytics_workspace_onboarding.sentinel_onboarding
  ]
}