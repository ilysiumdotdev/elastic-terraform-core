/*
--- Index Lifecycle Policies ---
Lifecycling behavior for indices, such as when data should be moved
between storage tiers and how long it should be retained in total.
*/

# Logs Default ILM Policy
resource "elasticstack_elasticsearch_index_lifecycle" "logs_default" {
  name = "logs-default-ilm-policy"

  hot {
    min_age = "0ms"
    rollover {
      max_age               = "1d"
      max_primary_shard_size = "10gb"
    }
  }

  warm {
    min_age = "7d"
    shrink {
      number_of_shards = 1
    }
    forcemerge {
      max_num_segments = 1
    }
  }

  delete {
    min_age = "30d"
    delete {}
  }

  metadata = jsonencode(merge({}, local.common_metadata))
}
