resource "google_sql_database_instance" "mysql_instance" {
  name             = var.mysql_instance_name
  project          = var.project_id
  region           = var.region
  database_version = "MYSQL_8_0"

  settings {
    tier              = var.tier
    #storage_size_gb   = var.storage_size
    disk_size = var.storage_size
    ip_configuration {
      private_network = var.vpc_network
    }
  }
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.mysql_instance.name
  project  = var.project_id
}

resource "google_sql_user" "database_user" {
  name     = var.database_user
  instance = google_sql_database_instance.mysql_instance.name
  project  = var.project_id
  password = var.database_password
}

