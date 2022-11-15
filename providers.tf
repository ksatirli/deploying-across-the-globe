# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  # AWS Region is required but irrelevant for the AWS Resources this code base interacts with.
  region = "us-west-2"
}

# The Terraform Cloud Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication
provider "tfe" {}
