variable "project_id" {
  description = "The GCP project ID where the resources will be created."
  type        = string
}

variable "region" {
  description = "The region for the resources."
  type        = string
  default     = "us-central1"  # Set a default region
}


variable "vpc_network" {
  description = "Name of the VPC Network for the Cloud SQL instance"
  type        = string
}

variable "vpc_subnet" {
  description = "Name of the VPC Network for the Cloud SQL instance"
  type        = string
}

/*
variable "subnet_self_link" {
  description = "The self-link of the subnet"
  type = string
}
*/

variable "sql_instance_name" {
  description = "Name of the Cloud SQL MySQL instance"
  type        = string
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
}

variable "db_user" {
  description = "Username for the database"
  type        = string
}

variable "db_user_password" {
  description = "Password for the database user"
  type        = string
}



variable "db_root_password" {
  description = "The root password for the SQL instance."
  type        = string
  sensitive   = true
}

