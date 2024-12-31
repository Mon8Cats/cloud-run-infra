locals {
  subnet_self_link = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/regions/${var.region}/subnetworks/${var.vpc_subnet}"
}