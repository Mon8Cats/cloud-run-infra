output "connection_name" {
  value = google_sql_database_instance.mysql_instance.connection_name
  description = "Connection name for the MySQL instance"
}

output "database_name" {
  value = google_sql_database.name
  description = "Name of the created database"
}

output "database_user" {
  value = google_sql_user.database_user.name
  description = "Name of the created database user"
}
