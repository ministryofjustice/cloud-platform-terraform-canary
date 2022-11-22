# cloud-platform-terraform-canary

This Terraform module creates an AWS Synthetics Canary resource for the Cloud Platform.

## Usage

See the [examples/](examples/) folder.

<!--- BEGIN_TF_DOCS --->

<!--- END_TF_DOCS --->

## Tags

Some of the inputs are tags. All infrastructure resources need to be tagged according to the [MOJ techincal guidance](https://ministryofjustice.github.io/technical-guidance/standards/documenting-infrastructure-owners/#documenting-owners-of-infrastructure). The tags are stored as variables that you will need to fill out as part of your module.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| application |  | string | - | yes |
| business_unit | Area of the MOJ responsible for the service | string | `mojdigital` | yes |
| environment |  | string | - | yes |
| infrastructure_support | The team responsible for managing the infrastructure. Should be of the form team-email | string | - | yes |
| is_production |  | string | `false` | yes |
| team_name |  | string | - | yes |

## Reading Material

https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html
