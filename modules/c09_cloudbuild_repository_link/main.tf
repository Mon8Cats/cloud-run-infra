resource "google_cloudbuildv2_repository" "my_repository" {
  location = var.region
  name = var.repo_name_gcp
  parent_connection = var.connection_parent
  remote_uri = var.repo_uri_remote
}
