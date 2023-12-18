terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentails_file)
  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}
