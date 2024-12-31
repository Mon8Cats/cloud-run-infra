# Terraform Settings Block
terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 6.0.0"
    }
  }
  backend "gcs" {
    bucket = "sky-tf-backend"
    prefix = "env/dev"    
  }
}

# Terraform Provider Block
provider "google" {
  project = var.project_id
  region = var.region
}