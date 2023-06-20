remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket  = "terragrunt-tfstate"
    prefix = "${path_relative_to_include()}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.48.0"
    }
  }
}
EOF
}

inputs = {
  project_id = "gcp-3456"
}
