terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "ksatirli"

    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "workspaces-seeder"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/4.39.0
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.39.0, < 5.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.38.0/
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.38.0, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.3.0"
}
