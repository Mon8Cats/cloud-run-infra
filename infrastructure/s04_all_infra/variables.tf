
# (1) environment variables **********
variable "project_id" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "project_number" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "region" {
  description = "Region in which GCP Resources to be created"
  type = string
  default = "us-east1"
}


# (2) api list **********
variable "api_list" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
}


# (3) secrets (GitHub and DB) **********
variable "secret_id_github" {
  description = "The region for the resources"
  type        = string
}

variable "secret_id_db_user" {
  description = "The region for the resources"
  type        = string
}

variable "secret_id_db_password" {
  description = "The region for the resources"
  type        = string
}


# (4) github connection, github account, repos **********
variable "connection_name_github" {
  description = "The region for the resources"
  type        = string
}

variable "installation_id_github_app" {
  description = "The region for the resources"
  type        = string
}

variable "github_account" {
  description = "The region for the resources"
  type        = string
}

variable "github_repo_infra" {
  description = "The region for the resources"
  type        = string
}

variable "github_repo_app" {
  description = "The region for the resources"
  type        = string
}
variable "gcp_repo_infra" {
  description = "The region for the resources"
  type        = string
}

variable "gcp_repo_app" {
  description = "The region for the resources"
  type        = string
}


# (5) service accounts and roles **********

variable "cicd_sa_infra" {
  description = "The service account to run the infra cicd pipeline (must be unique within the project)"
  type        = string
}

variable "cicd_sa_app" {
  description = "The service account to run the app cicd pipeline (must be unique within the project)"
  type        = string
}
variable "cloud_run_sa" {
  description = "The service account to run the app (must be unique within the project)"
  type        = string
}


variable "cicd_sa_infra_role_list" {
  type        = list(string)
  description = "A list of APIs for infra cicd sa"

}

variable "cicd_sa_app_role_list" {
  type        = list(string)
  description = "A list of APIs for app cicd sa"
}
variable "cloud_run_sa_role_list" {
  type        = list(string)
  description = "A list of APIs for cloud run sa"

}


# (6) workload identities **********
/* # defined as local variables

variable "wi_pool_id_infra" {
  description = "The Workload Identity Pool Id"
  type        = string
}

variable "wi_pool_name_infra" {
  description = "The Workload Identity Pool Name"
  type        = string
}

variable "wi_pool_provider_id_infra" {
  description = "The Workload Identity Provider Id"
  type        = string
}

variable "wi_pool_id_app" {
  description = "The Workload Identity Pool Id"
  type        = string
}

variable "wi_pool_name_app" {
  description = "The Workload Identity Pool Name"
  type        = string
}

variable "wi_pool_provider_id_app" {
  description = "The Workload Identity Provider Id"
  type        = string
}
*/


# (7) log buckets for Cloud Build **********
variable "logs_bucket_infra" {
  description = "The logs bucket for infra cicd"
  type        = string
}

variable "logs_bucket_app" {
  description = "The logs bucket for app cicd"
  type        = string
}