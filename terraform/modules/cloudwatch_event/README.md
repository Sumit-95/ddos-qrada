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
| [aws_cloudwatch_event_rule.event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.event_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_rule_description"></a> [event\_rule\_description](#input\_event\_rule\_description) | n/a | `string` | `"The CloudWatch Event that triggers the DDOS to QRadar Lambda function."` | no |
| <a name="input_event_rule_name"></a> [event\_rule\_name](#input\_event\_rule\_name) | The CloudWatch event rule name. | `any` | n/a | yes |
| <a name="input_target_lambda_arn"></a> [target\_lambda\_arn](#input\_target\_lambda\_arn) | Target arn of the Lambda function. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | n/a |


## hcl .tfvars file format

event_rule_description = "The CloudWatch Event that triggers the DDOS to QRadar Lambda function."
event_rule_name        = ""
target_lambda_arn      = ""
