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
  subnet_region    = var.subnet_region
  network_self_link = module.vpc.network_self_link
  project_id       = var.project_id
}
