resource "elasticstack_elasticsearch_index_lifecycle" "standard" {
  name = "ilm-standard"

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
}

resource "elasticstack_elasticsearch_index_lifecycle" "discovery" {
  name = "ilm-discovery"

  hot {
    min_age = "0ms"
    rollover {
      max_age = "1d"
      max_primary_shard_size = "5gb"
    }
  }

  delete {
    min_age = "3d"
    delete {}
  }
}