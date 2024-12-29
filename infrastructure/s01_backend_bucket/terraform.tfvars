/* No space around =
export TF_VAR_project_id="sky-cloud-run"
export TF_VAR_project_number="499017637982"
export TF_VAR_region="us-central1"
echo $TF_VAR_project_id
echo $TF_VAR_project_number
echo $TF_VAR_region
*/



pre_api_list   = [
    "cloudresourcemanager.googleapis.com", # or use gcloud, cloud console?
    "secretmanager.googleapis.com", 
    "storage.googleapis.com",
]

bucket_name = "skyroot-tf-backend" # globally unique name
