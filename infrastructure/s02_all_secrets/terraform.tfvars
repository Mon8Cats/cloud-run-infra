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
    "secretmanager.googleapis.com", # manually enabled
    "cloudbuild.googleapis.com",
  ]

# (5) Secret
secret_id_github = "github_token"
secret_id_db_user = "db_user"
secret_id_db_password = "db_password"

secret_data_github = "github_token"
secret_data_db_user = "db_user"
secret_data_db_password = "db_password"