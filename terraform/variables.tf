variable "elasticsearch_endpoint" {
    description = "The Elasticsearch host to connect to."
    type        = string
    default     = "https://elasticsearch.ilysium.io"
}

variable "kibana_endpoint" {
    description = "The Kibana host to connect to."
    type        = string
    default     = "https://elastic.ilysium.io"
}