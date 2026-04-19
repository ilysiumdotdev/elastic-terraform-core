resource "elasticstack_elasticsearch_security_role" "vector_writer" {
  name = "vector_writer"

  indices {
    names      = ["logs-*"]
    privileges = ["create", "create_index", "auto_configure"]
  }
}

