variable "project_id" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "region" {
  description = "Region in which GCP Resources to be created"
  type = string
  default = "us-east1"
}


variable "pre_api_list" {
  description = "A list of APIs"
  type        = list(string)
  #default     = ["value1", "value2", "value3"]  # optional default value
}

variable "bucket_name" {
  description = "The region for the resources"
  type        = string
}
