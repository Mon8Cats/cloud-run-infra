output "instance_connection_name" {
  description = "The connection name of the SQL instance."
  value       = google_sql_database_instance.quickstart_instance.connection_name
}