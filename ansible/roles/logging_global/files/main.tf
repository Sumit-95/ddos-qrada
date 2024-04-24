module "iam" {
  source = "../../modules/iam_global"
  iam_role_name = "${var.service_name}-lambda-function-role"
  iam_policy_name = "${var.service_name}-lambda-function-policy"
  iam_policy_document = "${data.aws_iam_policy_document.lambda_permission_policy.json}"
  iam_user_policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
  iam_role_policy_arn = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/AWSOrganizationsReadOnlyAccess", 
    "arn:aws:iam::aws:policy/AmazonInspectorReadOnlyAccess", 
    "arn:aws:iam::aws:policy/SecurityAudit"
  ]

  iam_role_assume_service_policy = "${data.aws_iam_policy_document.lambda_assume_role.json}"
  tags                           = "${local.common_tags}"
}

module lambda_function {
  source                 = "../../modules/lambda_function"
  aws_region             = "${var.aws_region}"
  lambda_function_name   = "${var.service_name}-lambda-function"
  role_arn               = "${module.iam.iam_role_arn}"
  lambda_env_vars        = "${local.lambda_env_vars}"
  tags                   = "${local.common_tags}"
}

module cloudwatch_event {
  source            = "../../modules/cloudwatch_event"
  event_rule_name   = "${local.cloudwatch_event_rule_name}"
  target_lambda_arn = "${module.lambda_function.lambda_arn}"
}

module cloudwatch_log_group {
  source                     = "../../modules/cloudwatch_log_group"
  cloudwatch_log_group_name  = "${local.cloudwatch_log_group_name}"
  cloudwatch_log_stream_name = "${local.cloudwatch_log_stream_name}"
  tags                       = "${local.common_tags}"
}
