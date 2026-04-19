resource "elasticstack_elasticsearch_component_template" "logs_base_settings" {
    name = "logs-base@settings"

    template {
        settings = jsonencode({
        "number_of_shards"     = 1
        "number_of_replicas"   = 0
        "refresh_interval"     = "30s"
        "index.lifecycle.name" = elasticstack_elasticsearch_index_lifecycle.standard.name
        })
    }
}

resource "elasticstack_elasticsearch_component_template" "logs_base_mappings" {
    name = "logs-base@mappings"

    template {
        mappings = jsonencode({
            properties = {
                "@dataset"   = { type = "keyword" }
                "@namespace" = { type = "keyword" }
                "@source"    = { type = "keyword" }
                "@timestamp" = { type = "date" }
            }

            dynamic_templates = [
                {
                    strings_as_keywords = {
                        match_mapping_type = "string"
                        mapping = { 
                            type = "keyword"
                        }
                    }
                }
            ]
        })
    }
}

resource "elasticstack_elasticsearch_component_template" "logs_hubble_flow_mappings" {
    name = "logs-hubble.flow@mappings"

    template {
        mappings = jsonencode({
            properties = {
                destination = {
                    properties = {
                        cluster_name = { type = "keyword" }
                        id           = { type = "integer" }
                        identity     = { type = "integer" }
                        ip           = { type = "ip" }
                        labels       = { type = "keyword" }
                        namespace    = { type = "keyword" }
                        pod          = { type = "keyword" }
                        port         = { type = "integer" }
                        workloads    = { type = "nested" }
                    }
                }
                event_type  = { type = "integer" }
                is_reply    = { type = "boolean" }
                node        = { type = "keyword" }
                node_labels = { type = "keyword" }
                protocol    = { type = "keyword" }
                source = {
                    properties = {
                        cluster_name = { type = "keyword" }
                        id           = { type = "integer"}
                        identity     = { type = "integer" }
                        ip           = { type = "ip" }
                        labels       = { type = "keyword" }
                        namespace    = { type = "keyword" }
                        pod          = { type = "keyword" }
                        port         = { type = "integer" }
                        workloads    = { type = "nested" }
                    }
                }
                trace_observation_point = { type = "keyword" }
                trace_reason            = { type = "keyword" }
                traffic_direction       = { type = "keyword" }
                type                    = { type = "keyword" }
                uuid                    = { type = "keyword" }
                verdict                 = { type = "keyword" }
            }
        })
    }
}

resource "elasticstack_elasticsearch_component_template" "logs_kubernetes_mappings" {
    name = "logs-kubernetes@mappings" 
    
    template {
        mappings = jsonencode({
            properties = {
                file = { type = "keyword" }
                kubernetes = {
                    properties = {
                        container          = { type = "keyword" }
                        container_id       = { type = "keyword" }
                        container_image    = { type = "keyword" }
                        container_image_id = { type = "keyword" }
                        namespace          = { type = "keyword" }
                        namespace_labels   = { type = "flattened" }
                        node               = { type = "keyword" }
                        node_labels        = { type = "flattened" }
                        pod                = { type = "keyword" }
                        pod_ip             = { type = "ip" }
                        pod_labels         = { type = "flattened" }
                        pod_namespace      = { type = "keyword" }
                        pod_node_name      = { type = "keyword" }
                        pod_owner          = { type = "keyword" }
                        pod_uid            = { type = "keyword" }
                    }
                }
                stream = { type = "keyword" }
            }
        })
    }
}

resource "elasticstack_elasticsearch_component_template" "logs_kubernetes_audit_mappings" {
    name = "logs-kubernetes.audit@mappings"

    template {
        mappings = jsonencode({
            properties = {
                annotations       = { type = "flattened" }
                api_version       = { type = "keyword" }
                audit_id          = { type = "keyword" }
                impersonated_user = { type = "flattened" }
                kind              = { type = "keyword" }
                level             = { type = "keyword" }
                object_ref        = { type = "flattened" }
                request_uri       = { type = "keyword" }
                response_status   = { type = "flattened" }
                source_ips        = { type = "keyword" }
                stage             = { type = "keyword" }
                user = {
                    properties = {
                        extra    = { type = "flattened" }
                        groups   = { type = "keyword" }
                        uid      = { type = "keyword"}
                        username = { type = "keyword" }
                    }
                }
                user_agent = { type = "keyword" }
                verb       = { type = "keyword" }

            }
        })
    }
}

resource "elasticstack_elasticsearch_component_template" "logs_vault_audit_mappings" {
    name = "logs-vault.audit@mappings"

    template {
      mappings = jsonencode({
        properties = {
            auth = {
                properties = {
                    accessor       = { type = "keyword" }
                    client_token   = { type = "keyword" }
                    display_name   = { type = "keyword" }
                    entity_id      = { type = "keyword" }
                    metadata       = { type = "flattened" }
                    policies       = { type = "keyword" }
                    policy_results = {
                        properties = {
                            allowed           = { type = "boolean" }
                            granting_policies = { type = "nested"}
                        }
                    }
                    token_policies   = { type = "keyword" }
                    token_issue_time = { type = "keyword" }
                    token_ttl        = { type = "integer" }
                    token_type       = { type = "keyword" }
                }
            }
            request = {
                properties = {
                    client_id             = { type = "keyword" }
                    client_token          = { type = "keyword" }
                    client_token_accessor = { type = "keyword" }
                    data                  = { type = "flattened" }
                    headers               = { type = "flattened" }
                    id                    = { type = "keyword" }
                    mount_accessor        = { type = "keyword" }
                    mount_class           = { type = "keyword" }
                    mount_point           = { type = "keyword" }
                    mount_running_version = { type = "keyword" }
                    mount_type            = { type = "keyword" }
                    operation             = { type = "keyword" }
                    path                  = { type = "keyword" }
                    remote_address        = { type = "ip" }
                    remote_port           = { type = "integer" }
                }
            }
            response = {
                properties = {
                    data                         = { type = "flattened" }
                    mount_accessor               = { type = "keyword" }
                    mount_class                  = { type = "keyword" }
                    mount_point                  = { type = "keyword" }
                    mount_running_plugin_version = { type = "keyword" }
                    mount_type                   = { type = "keyword" }
                    warnings                     = { type = "keyword" }
                }
            }
            type = { type = "keyword" }
        }
      })
    }
}

