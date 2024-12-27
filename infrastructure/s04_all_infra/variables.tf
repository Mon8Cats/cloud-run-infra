
# common ##############################################
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


# apis
variable "api_list" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
}



variable "cloud_run_sa_name" {
  description = "The ID of the service account to create (must be unique within the project)"
  type        = string
}

variable "cloud_run_sa_role_list" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
}



variable "connection_name_github" {
  description = "The region for the resources"
  type        = string
}

variable "secret_id_github" {
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

variable "secret_id_db_user" {
  description = "The region for the resources"
  type        = string
}

variable "secret_id_db_password" {
  description = "The region for the resources"
  type        = string
}

# infra ##############################
variable "cicd_sa_name_infra" {
  description = "The ID of the service account to create (must be unique within the project)"
  type        = string
}

variable "cicd_sa_role_list_infra" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
}


variable "logs_bucket_name_infra" {
  description = "The logs bucket name"
  type        = string
}

variable "logs_bucket_name_app" {
  description = "The logs bucket name"
  type        = string
}
# workload identity

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

variable "repository_infra_github" {
  description = "The region for the resources"
  type        = string
}


variable "repo_uri_infra_github" {
  description = "The region for the resources"
  type        = string
}

variable "repo_name_infra_gcp" {
  description = "The region for the resources"
  type        = string
}



variable "repo_name_infra_github" {
  description = "The region for the resources"
  type        = string
}

# app #############################
variable "cicd_sa_name_app" {
  description = "The ID of the service account to create (must be unique within the project)"
  type        = string
}

variable "cicd_sa_role_list_app" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
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

variable "repository_app_github" {
  description = "The region for the resources"
  type        = string
}

variable "repo_uri_app_github" {
  description = "The region for the resources"
  type        = string
}

variable "repo_name_app_gcp" {
  description = "The region for the resources"
  type        = string
}


variable "repo_name_app_github" {
  description = "The region for the resources"
  type        = string
}
