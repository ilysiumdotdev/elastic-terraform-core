/*
--- Component Templates ---
Components used to build index templates. These components manage 
reusable settings that can be applied to multiple indices.
*/

/*
--- logs@custom ---
This is a special component template referenced by the default 'logs' index template,
which matches against the index pattern 'logs-*-*'. Any settings defined here will apply
to all log indices if another component template does not override them. This component template
is useful to define default shard, replica, and retention behaviors for all log indices.
*/
resource "elasticstack_elasticsearch_component_template" "logs_custom" {
    name = "logs@custom"
    
    template {
        settings = jsonencode({
            "number_of_shards"     = 1
            "number_of_replicas"   = 0
            "refresh_interval"     = "30s"
            "index.lifecycle.name" = elasticstack_elasticsearch_index_lifecycle.logs_default.name
        })
    }

    metadata = jsonencode(merge({}, local.common_metadata))
}
