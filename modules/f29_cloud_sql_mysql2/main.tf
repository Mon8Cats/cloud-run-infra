
resource "google_sql_database_instance" "quickstart_instance" {
  name             = var.sql_instance_name
  database_version = "MYSQL_8_0"
  region = var.region

  settings {
    tier = "db-f1-micro"  # Equivalent to 1 vCPU, 4GB RAM tier. Adjust as needed
    /*
    ip_configuration {
        ipv4_enabled = false
        private_network = local.subnet_self_link 
    }
    */
  }

  root_password = var.db_root_password
  project = var.project_id
}

resource "google_sql_database" "quickstart_db" {
  name     = var.db_name
  instance = google_sql_database_instance.quickstart_instance.name
  project = var.project_id
}

resource "google_sql_user" "quickstart_user" {
  name     = var.db_user
  instance = google_sql_database_instance.quickstart_instance.name
  password = var.db_user_password
  project = var.project_id
}