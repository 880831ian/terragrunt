output "cluster_name" {
  value = google_container_cluster.cluster.name
}

output "project_id" {
  value = google_container_cluster.cluster.project
}

output "cluster_location" {
  value = google_container_cluster.cluster.location
}

output "cluster_version" {
  value = google_container_cluster.cluster.min_master_version
}


