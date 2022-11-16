<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| tfe_oauth_client_id | VCS Provider oAuth Client Identifier. | `string` | yes |
| tfe_organization | Name of the Terraform Cloud Organization. | `string` | yes |
| provider_prefix | Provider-specific Prefix for Terraform Cloud Workspace (Including trailing dash). | `string` | no |
| terraform_version | Version of Terraform to use for Terraform Cloud. | `string` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_regions | Exported Values of `data.aws_regions.currently_enabled`. |
| tfe_organization | Exported Values of `data.tfe_organization.main`. |
| tfe_variable_region | Exported Values of `tfe_variable.region`. |
<!-- END_TF_DOCS -->