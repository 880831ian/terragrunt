terraform {
  backend "gcs" {
    bucket      = "terragrunt-tfstate"
    prefix      = "/gcp-2345-ccc"
  }
}