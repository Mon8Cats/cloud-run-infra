
# Service Account
output "service_account_email" {
  description = "The email address of the service account"
  value       = module.cicd_service_account.service_account_email
}

output "service_account_id" {
  description = "The unique ID of the service account"
  value       = module.cicd_service_account.service_account_id
}

output "assigned_roles" {
  description = "List of roles assigned to the service account"
  value       = module.cicd_service_account.assigned_roles
}

# Workload Identity
output "wi_pool_id" {
  description = "The ID of Workload Identity Pool"
  value       = module.workload_identity.wi_pool_id
}

output "wi_pool_provider_id" {
  description = "The ID of Workload Identity Pool Provider"
  value       = module.workload_identity.wi_pool_provider_id
}

# Secret Token Access


# repository link
output "repository_id" {
  value = module.github_repository_link.repository_id
}