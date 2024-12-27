# (3) create a service account for cicd
module "cicd_service_account" {
  source               = "../b03_service_account"
  project_id           = var.project_id
  service_account_name = var.cicd_sa_name
  display_name         = "cicd Service Account"
  description          = "This service account is used for CI/CD operations"

  roles = var.cicd_sa_role_list

}


# (4) create workload identity pool
module "workload_identity" {
  source           = "../b04_workload_identity"

  project_id = var.project_id
  wi_pool_id = var.wi_pool_id
  wi_pool_name = var.wi_pool_name
  wi_pool_provider_id = var.wi_pool_provider_id
  github_repository = var.github_repository
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.cicd_sa_name}@${var.project_id}.iam.gserviceaccount.com"

  depends_on   = [module.cicd_service_account]
}

# log bucket
module "logs_bucket" {
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

  depends_on   = [module.cicd_service_account]
}

# permission to bucket
module "cloudbuild_logs_bucket_iam_binding" {
  source           = "../../modules/a02b_bucket_iam_binding"
  bucket_name      = var.bucket_name
  service_account_email   = local.service_account_email
  role             = "roles/storage.objectAdmin"

  depends_on   = [module.logs_bucket]
}



# (5) secret manager - common
# create token, save token - manual

# (6) secret token access
module "github_token_secret_access" {
  source              = "../c06_secret_access"
  secret_id = var.github_secret_id
  service_account_email = module.cicd_service_account.service_account_email
}


# (7) github connection - common


# (8) repository link
module "github_repository_link" {
  source = "../c09_cloudbuild_repository_link"

  region  = var.region
  connection_parent  = var.connection_parent
  repo_name_gcp = var.repo_name_gcp
  repo_uri_remote = var.repo_uri_remote

}

# (9) cloud build trigger - manual
