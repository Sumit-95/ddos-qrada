variable "aws_region" {
  description = "The region to connect to and use for the creation of resources"
}

variable "lambda_function_name" {
  description = "Lambda Function name."
}

variable "role_arn" {
  description = "Iam role for the Lambda Function."
}

variable "lambda_env_vars" {
  description = "Lambda environment variables."
  default     = {}
}

variable "tags" {
  description = "Tags to apply to Lambda Function."
  type        = "map"
}

variable "lambda_arn" {
  description = "Lambda ARN to connect."
  default = "arn:aws:lambda:eu-west-2:668764830176:function:bsl-cetdev-logging-ddos-qradar-lambda-function"
}