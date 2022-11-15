output "aws_regions" {
  description = "Exported Values of `data.aws_regions.currently_enabled`."
  value       = data.aws_regions.currently_enabled
}

output "tfe_organization" {
  description = "Exported Values of `data.tfe_organization.main`."
  value       = data.tfe_organization.main
}

output "tfe_variable_region" {
  description = "Exported Values of `tfe_variable.region`."
  value       = tfe_variable.region
  sensitive   = true
}
