output "private_ip" {
  description = "The private IP address of the Cloud SQL instance."
  value       = google_sql_database_instance.postgres_instance.private_ip_address
}

/*
output "public_ip" {
  description = "The public IP address of the Cloud SQL instance."
  value       = google_sql_database_instance.postgres_instance.public_ip_address
}
*/

output "instance_connection_name" {
  description = "Cloud SQL instance connection name"
  value       = google_sql_database_instance.postgres_instance.connection_name
}

output "database_name" {
  description = "Name of the PostgreSQL database"
  value       = google_sql_database.my_database.name
}

output "db_user" {
  description = "PostgreSQL username"
  value       = google_sql_user.db_user.name
}
