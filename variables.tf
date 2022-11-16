variable "tfe_organization" {
  type        = string
  description = "Name of the Terraform Cloud Organization."
}

variable "tfe_oauth_client_id" {
  type        = string
  description = "VCS Provider oAuth Client Identifier."
  sensitive   = true
}

variable "terraform_version" {
  type        = string
  description = "Version of Terraform to use for Terraform Cloud."
  default     = "1.3.4"
}

variable "provider_prefix" {
  type = string
  description = "Provider-specific Prefix for Terraform Cloud Workspace (Including trailing dash)."
  default = "aws-"
}
