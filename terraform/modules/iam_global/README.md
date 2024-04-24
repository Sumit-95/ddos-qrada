## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| iam\_role\_assume\_service\_policy | Policy for assume role | `any` | n/a | yes |
| iam\_role\_custom\_policy | Pass the policy document here | `map` | `{}` | no |
| iam\_role\_name | Application Name for IAm Role | `any` | n/a | yes |
| iam\_role\_policy\_arn | Policy arn for mapping to IAM role | `list` | `[]` | no |
| iam\_user\_name | Application Name for IAm Role | `any` | n/a | yes |
| iam\_user\_policy\_arn | policy arn for Iam user | `any` | n/a | yes |
| tags | Tags to apply to AWS resources | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| iam\_policy\_arn | n/a |
| iam\_policy\_name | n/a |
| iam\_role\_arn | n/a |
| iam\_user\_name | n/a |

