variable "project_id" {
  description = "The ID of the project in which to create the SQL instance."
  type        = string
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
}

variable "region" {
  description = "The region in which to deploy the instance."
  type        = string
  default     = "us-central1"
}

variable "database_version" {
  description = "The MySQL database version."
  type        = string
  default     = "MYSQL_8_0"
}

variable "tier" {
  description = "The machine tier (e.g., db-n1-standard-1)."
  type        = string
  default     = "db-f1-micro"
}

variable "subnet" {
  description = "The name of the subnet where the instance will be deployed."
  type        = string
}

variable "authorized_networks" {
  description = "List of CIDR ranges for IPs authorized to connect."
  type        = list(string)
  default     = []
}

variable "root_password" {
  description = "The root password for the MySQL instance."
  type        = string
  sensitive   = true
}

variable "deletion_protection" {
  description = "Whether or not to enable deletion protection on the instance."
  type        = bool
  default     = false
}
