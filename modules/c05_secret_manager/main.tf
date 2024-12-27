resource "google_secret_manager_secret" "secret" {
  project     = var.project_id
  secret_id = var.secret_id
  
  replication {
    auto {
    }
  }
}


resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret_data
}

resource "google_secret_manager_secret_version" "secret_version2" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret_data
}



# POST https://secretmanager.googleapis.com/v1/projects/PROJECT_ID/secrets/SECRET_ID:addVersion