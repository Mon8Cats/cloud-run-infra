/* No space around =
export TF_VAR_project_id="sky-cloud-run"
export TF_VAR_project_number="499017637982"
export TF_VAR_region="us-central1"
echo $TF_VAR_project_id
echo $TF_VAR_project_number
echo $TF_VAR_region

#bucket_name = "should be unique"
*/


# (2) api list
api_list   = [
    "cloudresourcemanager.googleapis.com", # manually enabled
    "storage.googleapis.com",
    "iam.googleapis.com", # to create service account
    "cloudbuild.googleapis.com",
    "secretmanager.googleapis.com", # manually enabled
    "artifactregistry.googleapis.com",
    "sqladmin.googleapis.com",
    "compute.googleapis.com",
    "run.googleapis.com",

    #"iamcredentials.googleapis.com",
    #"cloudbuild.googleapis.com",
    #"artifactregistry.googleapis.com",
    #"cloudresourcemanager.googleapis.com",
    #"compute.googleapis.com",          # Compute Engine API
    #"run.googleapis.com",              # Cloud Run API
    #"cloudfunctions.googleapis.com",   # Cloud Functions API
    #"container.googleapis.com",        # Kubernetes Engine API
    #"appengine.googleapis.com",        # App Engine Admin API
    #"cloudresourcemanager.googleapis.com", # Resource Manager API
    # Add or remove APIs as needed
  ]

cloud_run_sa_name = "cloud-run-sa"
cloud_run_sa_role_list = [
  "roles/secretmanager.secretAccessor",
  "roles/cloudsql.client",
]


# (5) Secret
secret_id_github = "github_token"
secret_id_db_user = "db_user"
secret_id_db_password = "db_password"

# (6) github connection #
# my github account, settings/applications/configure -> check url
installation_id_github_app = "55957239"
connection_name_github = "github_connection"

github_account = "Mon8Cats"


# infra ##################################################


#(3) infra cicd service account and roles
cicd_sa_name_infra = "cicd-sa-infra"

cicd_sa_role_list_infra = [
  "roles/cloudbuild.builds.editor",
  "roles/storage.admin",
  "roles/secretmanager.secretAccessor",
  "roles/iam.serviceAccountUser",
  "roles/resourcemanager.projectIamAdmin",
  "roles/viewer",
  "roles/compute.admin",
  "roles/iam.serviceAccountKeyAdmin",
  "roles/source.reader",
  "roles/cloudbuild.builds.builder",
  "roles/artifactregistry.admin",
  "roles/cloudsql.admin",
  "roles/compute.networkAdmin",
  "roles/compute.securityAdmin"

  #"roles/cloudbuild.builds.builder",

  #"roles/secretmanager.secretAccessor",
  
  #"roles/artifactregistry.reader",
  #"roles/artifactregistry.writer",
  #"roles/artifactregistry.admin",
  #"roles/storage.admin",
  #"roles/run.admin",
  #"roles/iam.workloadIdentityPoolAdmin",
  #"roles/iam.serviceAccountViewer",
  #"roles/container.developer",
  #"roles/iam.serviceAccountUser",
  #"roles/compute.networkAdmin",
  #"roles/compute.securityAdmin",
  #"roles/iam.serviceAccountAdmin",
  #"roles/serviceusage.serviceUsageAdmin",
  #"roles/cloudsql.admin",
  #"roles/viewer",
  
  #"roles/compute.subnetworkAdmin"
  #"roles/secretmanager.admin",
  #"roles/secretmanager.secretAccessor",
  #"roles/secretmanager.secretCreator"
]

logs_bucket_name_infra = "skydev-infra-build-logs"

# (4) Workload Identity
wi_pool_id_infra = "wi-pool-infra"
wi_pool_name_infra = "wi-pool-infra"
wi_pool_provider_id_infra = "wi-pool-provider-infra"

repository_infra_github      = "Mon8Cats/cloud-run-infra"
repo_uri_infra_github = "https://github.com/Mon8Cats/cloud-run-infra.git"
repo_name_infra_gcp = "cloud-run-infra"
repo_name_infra_github = "cloud-run-infra"


#############################################
cicd_sa_name_app = "cicd-sa-app"

cicd_sa_role_list_app = [
  "roles/cloudbuild.builds.editor",
  "roles/storage.admin",
  "roles/secretmanager.secretAccessor",
  "roles/iam.serviceAccountUser",
  "roles/resourcemanager.projectIamAdmin",
  "roles/viewer",
  "roles/compute.admin",
  "roles/iam.serviceAccountKeyAdmin",
  "roles/compute.networkAdmin",
  "roles/source.reader",
  "roles/cloudbuild.builds.builder",
  "roles/serviceusage.serviceUsageAdmin",
  "roles/run.admin",
]

logs_bucket_name_app = "skydev-app-build-logs"

wi_pool_id_app = "wi-pool-app"
wi_pool_name_app = "wi-pool-app"
wi_pool_provider_id_app = "wi-pool-provider-app"

repository_app_github      = "Mon8Cats/cloud-run-app"
repo_name_app_github = "cloud-run-app"
repo_uri_app_github = "https://github.com/Mon8Cats/cloud-run-app.git"
repo_name_app_gcp = "cloud-run-app"

