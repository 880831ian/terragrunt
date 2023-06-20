terraform {
  backend "gcs" {
    bucket      = "terragrunt-tfstate"
    prefix      = "/gcp-1234-ccc"
  }
}