

locals {
  my_pf = "sk"

  pf_connection_name_github = "${local.my_pf}-${var.connection_name_github}"

  pf_cicd_sa_infra = "${local.my_pf}-${var.cicd_sa_infra}"
  pf_cicd_sa_app = "${local.my_pf}-${var.cicd_sa_app}"
  pf_cloud_run_sa = "${local.my_pf}-${var.cloud_run_sa}"


  cicd_sa_infra_email = "${local.pf_cicd_sa_infra}@${var.project_id}.iam.gserviceaccount.com"
  cicd_sa_app_email = "${local.pf_cicd_sa_app}@${var.project_id}.iam.gserviceaccount.com"
  cloud_run_sa_email = "${local.pf_cloud_run_sa}@${var.project_id}.iam.gserviceaccount.com"
  #cloud_build_sa_email = "service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  cloud_build_sa_email = "${var.project_number}@cloudbuild.iam.gserviceaccount.com"

  # globally unique names # pool id (32), pool name (128), provider id (32), project num (12)
  wi_pool = "wpx"
  wi_pool_id_infra = "${local.wi_pool}-id-infra-${var.project_number}"
  wi_pool_name_infra = "${local.wi_pool}-name-infra-${var.project_number}"
  wi_pool_provider_id_infra = "${local.wi_pool}-prid-infra-${var.project_number}"
  wi_pool_id_app = "${local.wi_pool}-id-app-${var.project_number}"
  wi_pool_name_app = "${local.wi_pool}-name-app-${var.project_number}"
  wi_pool_provider_id_app = "${local.wi_pool}-prid-app-${var.project_number}"


  github_acct_repo_infra = "${var.github_account}/${var.github_repo_infra}"
  github_acct_repo_app = "${var.github_account}/${var.github_repo_app}"
  github_uri_infra = "https://github.com/${local.github_acct_repo_infra}.git"
  github_uri_app =  "https://github.com/${local.github_acct_repo_app}.git"
  gcp_repo_infra = var.github_repo_infra
  gcp_repo_app = var.github_repo_app

}