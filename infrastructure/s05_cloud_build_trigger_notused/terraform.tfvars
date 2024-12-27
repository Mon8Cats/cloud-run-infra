# common #############################################
/* No space around =
export TF_VAR_project_id="sky-root"
export TF_VAR_project_number="262659146932"
export TF_VAR_region="us-central1"
echo $TF_VAR_project_id
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


# (5) Secret
secret_id_github = "github_token"
secret_id_db_user = "db_user"
secret_id_db_password = "db_password"

# (6) github connection
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
  "roles/compute.networkAdmin",
  "roles/source.reader",
  "roles/cloudbuild.builds.builder",



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

# (4) Workload Identity
wi_pool_id_infra = "wi-pool-infra"
wi_pool_name_infra = "wi-pool-infra"
wi_pool_provider_id_infra = "wi-pool-provider-infra"

repository_infra_github      = "Mon8Cats/sky-dev-infra"
repo_uri_infra_github = "https://github.com/Mon8Cats/sky-dev-infra.git"
repo_name_infra_gcp = "sky-dev-infra"
repo_name_infra_github = "sky-dev-infra"


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
]

wi_pool_id_app = "wi-pool-app"
wi_pool_name_app = "wi-pool-app"
wi_pool_provider_id_app = "wi-pool-provider-app"

repository_app_github      = "Mon8Cats/sky-dev-app"
repo_name_app_github = "sky-dev-app"
repo_uri_app_github = "https://github.com/Mon8Cats/sky-dev-app.git"
repo_name_app_gcp = "sky-dev-app"

