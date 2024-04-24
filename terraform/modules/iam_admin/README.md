## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_role_assume_service_policy"></a> [iam\_role\_assume\_service\_policy](#input\_iam\_role\_assume\_service\_policy) | Policy for assume role | `any` | n/a | yes |
| <a name="input_iam_role_custom_policy"></a> [iam\_role\_custom\_policy](#input\_iam\_role\_custom\_policy) | Pass the policy document here | `map` | `{}` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Application Name for IAm Role | `any` | n/a | yes |
| <a name="input_iam_role_policy_arn"></a> [iam\_role\_policy\_arn](#input\_iam\_role\_policy\_arn) | Policy arn for mapping to IAM role | `list` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to AWS resources | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | n/a |


## hcl .tfvars file format

iam_role_assume_service_policy = ""
iam_role_custom_policy         = {}
iam_role_name                  = ""
iam_role_policy_arn            = []
tags                           = ""
