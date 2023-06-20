provider "google" {
  project      = var.project_id
}

resource "google_container_cluster" "cluster" {
  project    = var.project_id
  name     = var.cluster_name
  location = var.cluster_location
  node_locations = var.node_locations
  min_master_version = var.cluster_version
  network = var.network_name
  subnetwork = var.subnetwork_name
  default_max_pods_per_node = var.node_max_pods
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count = var.initial_node_count
  enable_intranode_visibility = false # 不允許節點間通訊
  enable_shielded_nodes = var.enable_shielded_nodes
  resource_labels = var.resource_labels

  ip_allocation_policy {
    cluster_secondary_range_name = "gke-pods"
    services_secondary_range_name = "gke-service"
  }

  addons_config {
    http_load_balancing {
      disabled = false # 啟用HTTP負載平衡
    }
    horizontal_pod_autoscaling {
      disabled = false # 啟用水平Pod自動擴展
    }
    network_policy_config {
      disabled = true # 啟用網路策略
    }
  }

  dynamic "dns_config" {
    for_each = var.dns_enabled ? [1] : []
    content {
      cluster_dns = var.cluster_dns
      cluster_dns_scope = var.cluster_dns_scope
    }
  }

  private_cluster_config {
    enable_private_nodes = true # 啟用私有節點
    enable_private_endpoint = false # 不啟用私有端點
    master_ipv4_cidr_block = var.private_cluster_ipv4_cidr
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false # 是否為此集群啟用客戶端證書授權
    }
  }

  dynamic "binary_authorization" {
    for_each = var.binary_authorization_enabled ? [1] : []
    content {
      evaluation_mode = var.binary_authorization
    }
  }

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"] # 啟用系統元件和工作負載的日誌
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"] # 啟用系統元件的監控
  }

  timeouts {}
}