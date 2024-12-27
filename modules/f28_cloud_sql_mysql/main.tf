resource "google_sql_database_instance" "mysql_instance" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region
  deletion_protection = var.deletion_protection

  settings {
    tier             = var.tier
    ip_configuration {
      ipv4_enabled    = true

    }

    location_preference {
      zone = "${var.region}-a"
    }

    backup_configuration {
      enabled = true
    }
  }

  depends_on = [
    google_compute_subnetwork.subnet
  ]
}


resource "google_sql_user" "root_user" {
  name     = "root"
  instance = google_sql_database_instance.mysql_instance.name
  password = var.root_password
}