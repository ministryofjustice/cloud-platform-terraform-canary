provider "aws" {
  region = "eu-west-2"
}

module "canary" {
  source                 = "../"
  canary_bucket          = module.s3.bucket_name
  canary_name            = "raz-test"
  hostname               = "google.com"
  port                   = "443"
  endpointpath           = "/"
  team_name              = var.team_name
  business_unit          = var.business_unit
  application            = var.application
  is_production          = var.is_production
  environment            = var.environment
  infrastructure_support = var.infrastructure_support
}

module "s3" {
  source                 = "github.com/ministryofjustice/cloud-platform-terraform-s3-bucket?ref=4.7.1"
  namespace              = "raz-test"
  team_name              = var.team_name
  business-unit          = var.business_unit
  application            = var.application
  is-production          = var.is_production
  environment-name       = var.environment
  infrastructure-support = var.infrastructure_support
}
