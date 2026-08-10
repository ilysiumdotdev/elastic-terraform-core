variable "elasticsearch_endpoint" {
    type        = string
    default     = "https://elasticsearch.ilysium.io"
    description = "The Elasticsearch host to connect to."
}

variable "kibana_endpoint" {
    type        = string
    default     = "https://elastic.ilysium.io"
    description = "The Kibana host to connect to."
}