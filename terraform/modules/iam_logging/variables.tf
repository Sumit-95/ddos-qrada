variable "iam_role_name" {
  description = "Application Name for IAm Role"
}

variable "iam_role_policy_arn" {
  description = " Policy arn for mapping to IAM role"
  default     = []
}

variable "iam_role_custom_policy" {
  description = "Pass the policy document here"
  default     = {}
}

variable "iam_role_assume_service_policy" {
  description = "Policy for assume role"
}

variable "iam_user_policy_arn" {
  description = "policy arn for Iam user"
}

variable "tags" {
  description = "Tags to apply to AWS resources"
  type        = "map"
}
