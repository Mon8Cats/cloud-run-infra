
variable "project_id" {
  type        = string
  description = "The ID of the service account to create (must be unique within the project)"

}

variable "region" {
  type        = string
  description = "ID of the GitHub token secret in Secret Manager"
}

# Service Account
variable "cicd_sa_name" {
  type        = string
  description = "The ID of the service account to create (must be unique within the project)"

}

variable "cicd_sa_role_list" {
  type        = list(string)
  description = "A list of service account roles"
}


# Workload Identity
variable "wi_pool_id" {
  description = "The Workload Identity Pool Id"
  type        = string
}

variable "wi_pool_name" {
  description = "The Workload Identity Pool Name"
  type        = string
}

variable "wi_pool_provider_id" {
  description = "The Workload Identity Provider Id"
  type        = string
}

variable "github_repository" {
  description = "The region for the resources"
  type        = string
}

# Secret Token Access
variable "github_secret_id" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}

/*
variable "service_account_email" {
  description = "Custom service account email for Cloud Build"
  type        = string
}
*/

# repository link
variable "connection_parent" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}


variable "repo_name_gcp" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}

variable "repo_uri_remote" {
  description = "Custom service account email for Cloud Build"
  type        = string
}

variable "bucket_name" {
  description = "The region for the resources"
  type        = string
}

