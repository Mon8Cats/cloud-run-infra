variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region for Cloud SQL instance"
  type        = string
}

variable "vpc_network" {
  description = "Name of the VPC Network for the Cloud SQL instance"
  type        = string
}

variable "mysql_instance_name" {
  description = "Name of the Cloud SQL MySQL instance"
  type        = string
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
}

variable "database_user" {
  description = "Username for the database"
  type        = string
}

variable "database_password" {
  description = "Password for the database user"
  type        = string
}

variable "tier" {
  description = "Machine type for the Cloud SQL instance"
  type        = string
  default     = "db-f1-micro"
}

variable "storage_size" {
  description = "Size of storage for the Cloud SQL instance (GB)"
  type        = number
  default     = 10
}

