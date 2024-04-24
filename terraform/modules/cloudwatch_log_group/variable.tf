variable "cloudwatch_log_group_name" {
  description = "CloudWatch Log Group name."
}

variable "cloudwatch_log_stream_name" {
  description = "CloudWatch Log Stream name."
}

variable "retention_period" {
  description = "CloudWatch log retention period."
  default     = "60"
}

variable "tags" {
  description = "Tags to apply to the CloudWatch Log Group."
  default     = {}
}
