# get information about current Terraform Cloud Organization
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization
data "tfe_organization" "main" {
  name = var.tfe_organization
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/oauth_client
data "tfe_oauth_client" "client" {
  oauth_client_id = var.tfe_oauth_client_id
}

# get all currently enabled AWS Regions
# see https://registry.terraform.io/providers/aaronfeng/aws/latest/docs/data-sources/regions
data "aws_regions" "currently_enabled" {}
