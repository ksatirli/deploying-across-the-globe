# create a Terraform Cloud Variable, containing the appropriate AWS Region
# uses `tfe_workspace.regions` as input, to establish the correct relationships
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "region" {
  for_each = {
    for region in tfe_workspace.regions :
    region.name => region
  }

  key          = "AWS_REGION"
  value        = replace(each.key, var.provider_prefix, "")
  category     = "env"
  description  = "AWS Region of the Workspace."
  workspace_id = each.value.id
}

## create a Terraform Cloud Variable, containing the appropriate TFC Organization
## this will be used in `ksatirli/regional-deployment-example/terraform.tf`
## see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
#resource "tfe_variable" "organization" {
#  for_each = {
#    for region in tfe_workspace.regions :
#    region.name => region
#  }
#
#  key          = "TF_CLOUD_ORGANIZATION"
#  value        = "ksatirli"
#  category     = "env"
#  description  = "Organization of the Terraform Cloud Workspace."
#  workspace_id = each.value.id
#}
#
## create a Terraform Cloud Variable, containing the appropriate TFC Workspace Name
## this will be used in `ksatirli/regional-deployment-example/terraform.tf`
## see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
#resource "tfe_variable" "workspace" {
#  for_each = {
#    for region in tfe_workspace.regions :
#    region.name => region
#  }
#
#  key          = "TF_WORKSPACE"
#  value        = each.key
#  category     = "env"
#  description  = "Name of the Terraform Cloud Workspace."
#  workspace_id = each.value.id
#}

# create a Terraform Cloud Variable, containing an appropriate S3 Bucket Name Prefix
# this will be used in `ksatirli/regional-deployment-example/terraform.tf`
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "bucket_prefix" {
  for_each = {
    for region in tfe_workspace.regions :
    region.name => region
  }

  key          = "bucket_prefix"
  value        = each.key
  category     = "terraform"
  description  = "Prefix of the S3 Bucket Name."
  workspace_id = each.value.id
}
