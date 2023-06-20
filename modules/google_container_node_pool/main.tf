provider "google" {
  project      = var.project_id
}

resource "google_container_node_pool" "node_pool" {
  name       = var.node_pool_name
  project    = var.project_id
  cluster    = var.cluster_name
  location   = var.cluster_location
  node_count = var.node_count
  version = var.cluster_version
  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size
    disk_type    = var.node_disk_type
    image_type   = var.node_image_type
    oauth_scopes    = var.node_oauth_scopes
    tags = var.node_tags   
    dynamic "taint" {
      for_each = var.node_taint_enabled ? [1] : []
      content {
        key    = var.node_taint_key
        value  = var.node_taint_value
        effect = var.node_taint_effect
      }
    }
  }
  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }
  upgrade_settings {
    max_surge       = var.upgrade_max_surge
    max_unavailable = var.upgrade_max_unavailable
    strategy        = var.upgrade_strategy
  }
  dynamic "autoscaling" {
    for_each = var.autoscaling_enabled ? [1] : []
    content {
      max_node_count = var.autoscaling_max_node_count
      min_node_count = var.autoscaling_min_node_count      
      total_max_node_count = var.autoscaling_total_max_node_count
      total_min_node_count = var.autoscaling_total_min_node_count
    }
  }
  timeouts {}
}