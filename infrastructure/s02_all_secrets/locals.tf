# get default cloud build service account email address

locals {
  cloud_build_service_account_email = "service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
}
