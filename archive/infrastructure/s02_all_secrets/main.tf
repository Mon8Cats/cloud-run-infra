
# (1) enable apis
module "enable_apis" {
  source     = "../../modules/a01_enable_apis"
  project_id = var.project_id
  api_services = var.api_list
}

# (2) store secrets
module "secret_github_token" {
  source              = "../../modules/b01_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_github
  secret_data = var.secret_data_github
}

module "secret_db_user" {
  source              = "../../modules/b01_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_user
  secret_data = var.secret_data_db_user
}

module "secret_db_password" {
  source              = "../../modules/b01_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_password
  secret_data = var.secret_data_db_password
}

# (3) enable the cloud build default account to access the github token
module "github_token_secret_access_cloud_build_sa" {
  source              = "../../modules/b02_secret_access"
  secret_id = var.secret_id_github
  service_account_email = local.cloud_build_service_account_email

  depends_on = [ module.enable_apis, module.secret_github_token ]
}

