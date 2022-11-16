# read and understand the following code before applying this pattern to your project(s)
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
#resource "tfe_workspace" "resources_overview" {
#  name                          = "resources-overview"
#  organization                  = data.tfe_organization.main.name
#  description                   = "Resources Overview."
#  allow_destroy_plan            = false
#  auto_apply                    = true
#  execution_mode                = "local"
#  assessments_enabled           = true
#  structured_run_output_enabled = true
#  terraform_version = var.terraform_version
#
#  # see https://github.com/ksatirli/regional-deployment-example
#  vcs_repo {
#    identifier     = "ksatirli/regional-deployment-overview"
#    branch         = "main"
#    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
#  }
#}

# creating workspaces within a loop is not a common practice
# read and understand the following code before applying this pattern to your project(s)
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "regions" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset(data.aws_regions.currently_enabled.names)

  name               = "${var.provider_prefix}${each.key}"
  organization       = data.tfe_organization.main.name
  description        = "Regional Workspace for `${each.key}`."
  allow_destroy_plan = false
  auto_apply         = true
  execution_mode     = "remote"

  assessments_enabled           = true
  structured_run_output_enabled = true
  #remote_state_consumer_ids = [
  #  tfe_workspace.resources_overview.id
  #]

  tag_names = [
    "regional",
  ]

  terraform_version = var.terraform_version

  # see https://github.com/ksatirli/regional-deployment-example
  vcs_repo {
    identifier     = "ksatirli/regional-deployment-example"
    branch         = "main"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}
