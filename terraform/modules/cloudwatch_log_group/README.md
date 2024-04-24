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
| [aws_cloudwatch_log_group.cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.cloudwatch_log_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#input\_cloudwatch\_log\_group\_name) | CloudWatch Log Group name. | `any` | n/a | yes |
| <a name="input_cloudwatch_log_stream_name"></a> [cloudwatch\_log\_stream\_name](#input\_cloudwatch\_log\_stream\_name) | CloudWatch Log Stream name. | `any` | n/a | yes |
| <a name="input_retention_period"></a> [retention\_period](#input\_retention\_period) | CloudWatch log retention period. | `string` | `"60"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the CloudWatch Log Group. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_grp_arn"></a> [log\_grp\_arn](#output\_log\_grp\_arn) | n/a |
| <a name="output_log_grp_name"></a> [log\_grp\_name](#output\_log\_grp\_name) | n/a |


## hcl .tfvars file format

cloudwatch_log_group_name  = ""
cloudwatch_log_stream_name = ""
retention_period           = "60"
tags                       = {}
