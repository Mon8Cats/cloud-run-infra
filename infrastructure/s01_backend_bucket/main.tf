# export TF_VAR_project_id="sky-root"
# export TF_VAR_region="us-central1"


module "enable_apis" {
  source                  = "../../modules/a01_enable_apis"
  project_id  = var.project_id
  api_services = var.pre_api_list
}

module "terraform_backend_bucket" {
  source                  = "../../modules/a02_gcs_bucket"
  project_id              = var.project_id
  bucket_name             = var.bucket_name
  location                = var.region  #"US", "EU", "ASIA" multi-regional bucket
  storage_class           = "STANDARD" # Nearline, Coldline, Archive
  versioning_enabled      = true
  enable_retention_policy = true
  retention_period_days   = 30
  retention_policy_locked = false
  lifecycle_rules = [
    {
      action_type = "Delete"
      condition   = { age = 365 }
    }
  ]

  depends_on   = [module.enable_apis]
}
