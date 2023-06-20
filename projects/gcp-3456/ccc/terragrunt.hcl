terraform {
  source = "${get_path_to_repo_root()}/modules/google_compute_instance"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  instance_name = "gcp-3456-ccc"
  machine_type  = "e2-small"
  instance_zone = "asia-east1-b"
  instance_tags = []
  instance_labels = {}
  boot_disk_auto_delete = true
  boot_disk_image_name  = "debian-cloud/debian-10"
  boot_disk_size        = 500
  attached_disk_enabled = false
  attached_disk_name    = ""
  attached_disk_mode    = "READ_ONLY"
  attached_disk_source  = ""
  network_name          = "馬賽克"
  subnetwork_name       = "馬賽克"
  nat_ip_enabled        = true
  metadata = {}
  enable_display        = false
  resource_policies     = []
  service_account_email = "馬賽克"
  service_account_scopes = [
    "https://www.googleapis.com/auth/devstorage.read_write",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
  deletion_protection       = false
  allow_stopping_for_update = false
}
