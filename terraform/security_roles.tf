/*
--- Security Roles ---
Roles within Elastic that grant privileges to perform index and stack operations.
*/

# Log Aggregator Role
resource "elasticstack_elasticsearch_security_role" "log_aggregator" {
  name        = "log_aggregator"
  description = "Grants access to all logs indices (logs-*) to configure new indices and push data."

  indices {
    names      = ["logs-*"]
    privileges = ["create", "create_index", "auto_configure"]
  }

  metadata = jsonencode(merge({}, local.common_metadata))
}
