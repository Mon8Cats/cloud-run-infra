output "instance_connection_name" {
  description = "The connection name of the instance."
  value       = google_sql_database_instance.mysql_instance.connection_name
}
