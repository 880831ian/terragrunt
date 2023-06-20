terraform {
  source = "${get_path_to_repo_root()}/modules/google_container_node_pool"
}

include {
  path = find_in_parent_folders()
}

dependency "cluster" {
  config_path = "../cluster"
}

inputs = {
  cluster_name      = dependency.cluster.outputs.cluster_name
  cluster_location  = dependency.cluster.outputs.cluster_location
  cluster_version   = dependency.cluster.outputs.cluster_version
  node_pool_name    = "test"
  node_count        = 1
  node_machine_type = "e2-small"
  node_disk_size    = 100
  node_disk_type    = "pd-standard"
  node_image_type   = "COS_CONTAINERD"
  node_oauth_scopes = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
  node_tags                        = []
  node_taint_enabled               = false
  node_taint_key                   = ""
  node_taint_value                 = ""
  node_taint_effect                = ""
  auto_repair                      = true
  auto_upgrade                     = true
  upgrade_max_surge                = 1
  upgrade_max_unavailable          = 0
  upgrade_strategy                 = "SURGE"
  autoscaling_enabled              = true
  autoscaling_max_node_count       = 2
  autoscaling_min_node_count       = 1
  autoscaling_total_max_node_count = 0
  autoscaling_total_min_node_count = 0
}
