## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| aws\_region | The region to connect to and use for the creation of resources | `any` | n/a | yes |
| lambda\_env\_vars | Lambda environment variables. | `map` | `{}` | no |
| lambda\_function\_name | Lambda Function name. | `any` | n/a | yes |
| logging\_account\_number | Logging account number. | `any` | n/a | yes |
| role\_arn | Iam role for the Lambda Function. | `any` | n/a | yes |
| tags | Tags to apply to Lambda Function. | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_arn | n/a |

