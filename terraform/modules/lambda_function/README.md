## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [archive_file.zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The region to connect to and use for the creation of resources | `any` | n/a | yes |
| <a name="input_lambda_arn"></a> [lambda\_arn](#input\_lambda\_arn) | Lambda ARN to connect. | `string` | `"arn:aws:lambda:eu-west-2:668764830176:function:bsl-cetdev-logging-ddos-qradar-lambda-function"` | no |
| <a name="input_lambda_env_vars"></a> [lambda\_env\_vars](#input\_lambda\_env\_vars) | Lambda environment variables. | `map` | `{}` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | Lambda Function name. | `any` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Iam role for the Lambda Function. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to Lambda Function. | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | n/a |


## hcl .tfvars file format

aws_region           = ""
lambda_arn           = "arn:aws:lambda:eu-west-2:668764830176:function:bsl-cetdev-logging-ddos-qradar-lambda-function"
lambda_env_vars      = {}
lambda_function_name = ""
role_arn             = ""
tags                 = ""
