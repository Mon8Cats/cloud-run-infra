resource "google_compute_global_address" "private_ip_address" {
  name          = "${var.instance_name}-private-ip"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = local.vpc_self_link
  project       = var.project_id
  region        = var.region
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider         = google-beta
  network          = local.vpc_self_link
  service          = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
  project          = var.project_id
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = var.instance_name
  project          = var.project_id
  region           = var.region

  settings {
    tier              = "db-f1-micro" # Adjust the machine type as needed
    ip_configuration {
      ipv4_enabled    = false # true
      private_network = google_compute_global_address.private_ip_address.self_link
    }
  }

  database_version  = "POSTGRES_14" # Adjust the PostgreSQL version if needed
}


resource "google_sql_database" "my_database" {
  name     = var.database_name
  instance = google_sql_database_instance.postgres_instance.name
  project = var.project_id
}

resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres_instance.name
  password = var.db_password
  project = var.project_id
}

