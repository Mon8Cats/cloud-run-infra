/* No space around =
export TF_VAR_project_id="sky-root"
export TF_VAR_project_number="262659146932"
export TF_VAR_region="us-central1"
echo $TF_VAR_project_id
echo $TF_VAR_region
#bucket_name = "should be unique"
*/


# (1) enable apis
module "enable_apis" {
  source     = "../../modules/a01_enable_apis"
  project_id = var.project_id
  api_services = var.api_list
}


# github connection
module "github_connection" {
  source = "../../modules/c08_cloudbuild_connection"

  project_id               = var.project_id
  region                   = var.region
  github_app_installation_id = var.installation_id_github_app
  connection_name = var.connection_name_github
  secret_id = var.secret_id_github

}


module "cicd_pipeline_infra" {
  source = "../../modules/d11_cicd_pipeline_wrapper"

  project_id = var.project_id
  region = var.region
  cicd_sa_name = var.cicd_sa_name_infra
  cicd_sa_role_list = var.cicd_sa_role_list_infra
  bucket_name = var.logs_bucket_name_infra
  wi_pool_id = local.wi_pool_id_infra
  wi_pool_name = local.wi_pool_name_infra
  wi_pool_provider_id = local.wi_pool_provider_id_infra
  github_repository = var.repository_infra_github
  github_secret_id = var.secret_id_github
  connection_parent = module.github_connection.connection_name
  repo_name_gcp = var.repo_name_infra_gcp
  repo_uri_remote = var.repo_uri_infra_github 


  depends_on   = [module.github_connection]
}


module "cicd_pipeline_app" {
  source = "../../modules/d11_cicd_pipeline_wrapper"

  project_id = var.project_id
  region = var.region
  cicd_sa_name = var.cicd_sa_name_app
  cicd_sa_role_list = var.cicd_sa_role_list_app
  bucket_name = var.logs_bucket_name_app
  wi_pool_id = local.wi_pool_id_app
  wi_pool_name = local.wi_pool_name_app
  wi_pool_provider_id = local.wi_pool_provider_id_app
  github_repository = var.repository_app_github
  github_secret_id = var.secret_id_github
  connection_parent = module.github_connection.connection_name
  repo_name_gcp = var.repo_name_app_gcp
  repo_uri_remote = var.repo_uri_app_github 


  depends_on   = [module.github_connection]
}


# (6) secret db_user/db_password access

module "secret_access_db_user_infra" {
  source              = "../../modules/c06_secret_access"
  secret_id = var.secret_id_db_user
  service_account_email = module.cicd_pipeline_infra.service_account_email
}
module "secret_access_db_user_app" {
  source              = "../../modules/c06_secret_access"
  secret_id = var.secret_id_db_user
  service_account_email = module.cicd_pipeline_app.service_account_email
}

module "secret_access_db_password_infra" {
  source              = "../../modules/c06_secret_access"
  secret_id = var.secret_id_db_password
  service_account_email = module.cicd_pipeline_infra.service_account_email
}
module "secret_access_db_password_app" {
  source              = "../../modules/c06_secret_access"
  secret_id = var.secret_id_db_password
  service_account_email = module.cicd_pipeline_app.service_account_email
}



# (3) create a service account for cloud run
module "cloud_run_service_account" {
  source               = "../../modules/b03_service_account"
  project_id           = var.project_id
  service_account_name = var.cloud_run_sa_name
  display_name         = "Cloud Run Service Account"
  description          = "This service account is used for cloud run service"

  roles = var.cloud_run_sa_role_list

}


module "cloud_run_iam_binding" {
  source       = "../../modules/b03b_service_account_iam_binding"
  project_id   = var.project_id
  cloud_run_sa = "${var.cloud_run_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  cicd_sa      = "${var.cicd_sa_name_app}@${var.project_id}.iam.gserviceaccount.com"

   depends_on   = [module.cicd_pipeline_app, module.cloud_run_service_account]
}

