variable "tfe_organization" {
  type        = string
  description = "Name of the Terraform Cloud Organization."
}

variable "tfe_oauth_client_id" {
  type        = string
  description = "VCS Provider oAuth Client Identifier."
  sensitive   = true
}
