terraform {
  source = "${get_path_to_repo_root()}/modules/google_container_cluster"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name             = "tf-test"
  cluster_location         = "asia-east1-b"
  node_locations           = []
  cluster_version          = "1.24.12-gke.500"
  network_name             = "馬賽克"
  subnetwork_name          = "馬賽克"
  node_max_pods            = 64
  remove_default_node_pool = true
  initial_node_count       = 1
  enable_shielded_nodes    = false
  resource_labels = {}
  dns_enabled                  = false
  cluster_dns                  = "PROVIDER_UNSPECIFIED"
  cluster_dns_scope            = "DNS_SCOPE_UNSPECIFIED"
  private_cluster_ipv4_cidr    = "馬賽克"
  binary_authorization_enabled = true
  binary_authorization         = "DISABLED"
}
