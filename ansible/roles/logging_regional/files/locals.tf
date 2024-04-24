locals {
  #lambda_function_name       = "${var.service_name}_lamdba_function"
  cloudwatch_event_rule_name = "${var.service_name}-cloudwatch-event-rule"
  cloudwatch_log_group_name  = "${var.service_name}-cloudwatch-log-group"
  cloudwatch_log_stream_name = "${var.service_name}-cloudwatch-log-stream"

  admin_account_mapping = {
    # CETDEV
    "668764830176" {
      admin_account_id        = "805097478809"
      admin_organization_role = "bsl-cetdev-admin-ddos-qradar-describe-organizations-role"
      project_code            = "01257-200"
      logging_account_id      = "668764830176"
    }
    # CETTEST
    "178111371884" {
      admin_account_id        = "678216654380"
      admin_organization_role = "bsl-cettest-admin-ddos-qradar-describe-organizations-role"
      project_code            = "01257-200"
      logging_account_id      = "178111371884"
    }
    # MASTER
    "229415471955" {
      admin_account_id        = "725799391269"
      admin_organization_role = "bsl-master-admin-ddos-qradar-describe-organizations-role"
      project_code            = "01257-000"
      logging_account_id      = "229415471955"
    }
  }
  
  common_tags = "${map(
        "ApplicationName"   , "DDOS_QRadar",
        "ApplicationID"     , "${var.application_id}",
        "CostCentre"        , "${var.cost_centre}",
        "ManagedBy"         , "CET",
        "ProjectCode"       , "${lookup(local.admin_account_mapping[data.aws_caller_identity.current.account_id], "project_code")}",
        "Automation"        , "N/A",
        "Environment"       , "${upper(var.environment)}",
        "Owner"             , "CloudEngineering@abcd.com",
        "Region"            , "${var.aws_region}",
        "Reason"            , "DDOS_QRadar"
    )}"

   "lambda_env_vars" = {
    "LOG_GROUP_FULL_NAME"                 = "${local.cloudwatch_log_group_name}"
    "LOG_STREAM_FULL_NAME"                = "${local.cloudwatch_log_stream_name}"
  }

  logging_account = "${lookup(local.admin_account_mapping[data.aws_caller_identity.current.account_id], "logging_account_id")}"

  lambda_arn = "${format("arn:aws:lambda:eu-west-2:%s:function:%s-logging-ddos-qradar-lambda-function", local.logging_account, var.lambda_prefix)}"
  
}
