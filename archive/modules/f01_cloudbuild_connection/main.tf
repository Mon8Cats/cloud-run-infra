resource "google_cloudbuildv2_connection" "github_connection" {
  location = var.region
  name = var.connection_name

  github_config {
    app_installation_id = var.github_app_installation_id

    authorizer_credential {

      oauth_token_secret_version = "projects/${var.project_id}/secrets/${var.secret_id}/versions/latest"
    }
  }
}
