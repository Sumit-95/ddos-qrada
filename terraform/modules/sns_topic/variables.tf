variable "aws_region" {
  description = "The region to connect to and use for the creation of resources"
}

variable "tags" {
  description = "Tags to apply to Lambda Function."
  type        = "map"
}

variable "snspolicy" {
  description = "Tags to apply to Lambda Function."
}

variable "lambda_arn" {
  description = "lambda_arn"
}

variable "service_name" {
  description = "Service name for resources"
}