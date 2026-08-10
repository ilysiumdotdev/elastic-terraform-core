terraform {
  required_providers {
    elasticstack = {
      source  = "elastic/elasticstack"
      version = "~> 0.16.3"
    }
  }
}

provider "elasticstack" {
    elasticsearch {
      endpoints = [var.elasticsearch_endpoint]
    }
    kibana {
      endpoints = [var.kibana_endpoint]
    }
}