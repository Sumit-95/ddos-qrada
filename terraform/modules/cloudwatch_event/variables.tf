variable "event_rule_name" {
  description = "The CloudWatch event rule name."
}

variable "event_rule_description" {
  default = "The CloudWatch Event that triggers the DDOS to QRadar Lambda function."
}

variable "target_lambda_arn" {
  description = "Target arn of the Lambda function."
}
