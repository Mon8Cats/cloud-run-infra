module "vpc" {
  source                  = "../../modules/f21_vpc"
  network_name            = var.vpc_name
  auto_create_subnetworks = false
  project_id              = var.project_id
}

module "subnet" {
  source           = "../../modules/f22_subnet"
  subnet_name      = var.subnet_name
  subnet_ip_range  = var.subnet_ip_range
  subnet_region    = var.region
  network_self_link = module.vpc.network_self_link
  project_id       = var.project_id
}


module "allow_http_https" {
  source         = "../../modules/f23_firewall"
  project_id     = var.project_id
  rule_name      = "allow-http-https"
  network        = module.vpc.network_self_link
  direction      = "INGRESS"
  priority       = 1000
  allow_protocol = "tcp"
  allow_ports    = ["80", "443"]
  source_ranges  = ["0.0.0.0/0"]
  target_tags    = ["web-server"]
}

module "allow_ssh" {
  source         = "../../modules/f23_firewall"
  project_id     = var.project_id
  rule_name      = "allow-ssh"
  network        = module.vpc.network_self_link
  direction      = "INGRESS"
  priority       = 1000
  allow_protocol = "tcp"
  allow_ports    = ["22"]
  source_ranges  = ["0.0.0.0/0"]
  target_tags    = ["ssh-access"]
}


module "artifact_registry_repository" {
  source         = "../../modules/f26_artifact_repository"
  project_id = var.project_id
  region = var.region
  repository_id = var.artifact_repository_id # no underscore 4 to 63 characters
  description     = "Repository for storing Docker images"
  mode            = "STANDARD_REPOSITORY"
}

# Data source to retrieve the db_user from Secret Manager
data "google_secret_manager_secret_version" "db_user" {
  project = var.project_id
  secret  = var.secret_id_db_user  # The name of your secret in Secret Manager
  version = "latest"
}

# Data source to retrieve the db_password from Secret Manager
data "google_secret_manager_secret_version" "db_password" {
  project = var.project_id
  secret  = var.secret_id_db_password  # The name of your secret in Secret Manager
  version = "latest"
}


/*
module "cloud_sql_postgres" {
  source            =  "../../modules/f27_cloud_sql_postgres"
  project_id        = var.project_id
  region            = var.project_region
  instance_name     = var.sql_instance_name
  database_name     = var.sql_db_name
  db_user           = data.google_secret_manager_secret_version.db_user.secret_data
  db_password       = data.google_secret_manager_secret_version.db_password.secret_data
  tier              = "db-perf-optimized-N-2" #"db-n1-standard-1"
  database_version  = "POSTGRES_16"
  enable_private_ip = false
  availability_type = "ZONAL"
  vpc_name          = var.vpc_name
}
*/


/*
module "mysql_instance" {
  source            =  "../../modules/f28_cloud_sql_mysql"
  project_id         = var.project_id
  region             = var.project_region
  vpc_network        = "projects/${var.project_id}/global/networks/${var.vpc_name}"
  mysql_instance_name = var.sql_instance_name
  database_name      = var.sql_db_name
  database_user      = data.google_secret_manager_secret_version.db_user.secret_data
  database_password  = data.google_secret_manager_secret_version.db_password.secret_data
  tier               = "db-f1-micro"
  storage_size       = 20 # Specify storage size in GB
}
*/

module "mysql_instance2" {
  source            =  "../../modules/f29_cloud_sql_mysql2"
  project_id         = var.project_id
  region             = var.region
  sql_instance_name = var.sql_instance_name
  db_name = var.sql_db_name
  db_root_password = data.google_secret_manager_secret_version.db_password.secret_data
  db_user =  data.google_secret_manager_secret_version.db_user.secret_data
  db_user_password = data.google_secret_manager_secret_version.db_password.secret_data
  #subnet_self_link = module.subnet.subnet_self_link
  vpc_network = var.vpc_name
  vpc_subnet = var.subnet_name
  #vpc_network = "vpc_network" 
}