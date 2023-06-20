provider "google" {
  project      = var.project_id
  zone         = var.instance_zone
}

resource "google_compute_instance" "instance" {
    name         = var.instance_name
    machine_type = var.machine_type
    zone         = var.instance_zone
    tags = var.instance_tags   
    labels = var.instance_labels

    boot_disk {
      auto_delete = var.boot_disk_auto_delete
      initialize_params {
        image = var.boot_disk_image_name
        size = var.boot_disk_size
      }
    }

    dynamic "attached_disk" {
      for_each = var.attached_disk_enabled ? [1] : []
      content {
        device_name = var.attached_disk_name
        mode = var.attached_disk_mode
        source = var.attached_disk_source         
      }
    }

    network_interface {
      network = var.network_name
      subnetwork = var.subnetwork_name

      dynamic "access_config" {
        for_each = var.nat_ip_enabled ? [1] : []
        content {
        }
      }
    }

    metadata = var.metadata
    enable_display = var.enable_display
    resource_policies = var.resource_policies

    service_account {
      email  = var.service_account_email
      scopes = var.service_account_scopes
    }

    timeouts {}
    deletion_protection = var.deletion_protection
    allow_stopping_for_update = var.allow_stopping_for_update
}
