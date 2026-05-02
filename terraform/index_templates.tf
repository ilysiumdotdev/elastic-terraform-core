resource "elasticstack_elasticsearch_index_template" "logs_envoy_access" {
  name = "logs-envoy.access"

  index_patterns = ["logs-envoy.access-*"]
  priority       = 300

  composed_of = [
    elasticstack_elasticsearch_component_template.logs_base_settings.name,
    elasticstack_elasticsearch_component_template.logs_base_mappings.name,
  ]

  data_stream {}
}
resource "elasticstack_elasticsearch_index_template" "logs_hubble_flow" {
  name = "logs-hubble.flow"

  index_patterns = ["logs-hubble.flow-*"]
  priority       = 300

  composed_of = [
    elasticstack_elasticsearch_component_template.logs_base_settings.name,
    elasticstack_elasticsearch_component_template.logs_base_mappings.name,
    elasticstack_elasticsearch_component_template.logs_hubble_flow_mappings.name
  ]

  data_stream {}
}


resource "elasticstack_elasticsearch_index_template" "logs_kubernetes" {
  name = "logs-kubernetes"

  index_patterns = ["logs-kubernetes.*-*"]
  priority       = 200

  composed_of = [
    elasticstack_elasticsearch_component_template.logs_base_settings.name,
    elasticstack_elasticsearch_component_template.logs_base_mappings.name,
    elasticstack_elasticsearch_component_template.logs_kubernetes_mappings.name
  ]

  data_stream {}
}


resource "elasticstack_elasticsearch_index_template" "logs_kubernetes_audit" {
  name = "logs-kubernetes.audit"

  index_patterns = ["logs-kubernetes.audit-*"]
  priority       = 300

  composed_of = [
    elasticstack_elasticsearch_component_template.logs_base_settings.name,
    elasticstack_elasticsearch_component_template.logs_base_mappings.name,
    elasticstack_elasticsearch_component_template.logs_kubernetes_audit_mappings.name
  ]
  
  data_stream {}
}

resource "elasticstack_elasticsearch_index_template" "logs_unifi" {
  name = "logs-unifi"

  index_patterns = ["logs-unifi-*"]
  priority       = 300 

  composed_of = [
    elasticstack_elasticsearch_component_template.logs_base_settings.name,
    elasticstack_elasticsearch_component_template.logs_base_mappings.name,
  ]

  data_stream {}
}

resource "elasticstack_elasticsearch_index_template" "logs_vault_audit" {
  name = "logs-vault.audit"

  index_patterns = ["logs-vault.audit-*"]
  priority       = 300 

  composed_of = [
    elasticstack_elasticsearch_component_template.logs_base_settings.name,
    elasticstack_elasticsearch_component_template.logs_base_mappings.name,
    elasticstack_elasticsearch_component_template.logs_kubernetes_mappings.name,
    elasticstack_elasticsearch_component_template.logs_vault_audit_mappings.name
  ]

  data_stream {}
}
