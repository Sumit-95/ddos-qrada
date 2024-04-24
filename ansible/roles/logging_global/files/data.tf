data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "lambda_permission_policy" {
  "statement" {
    "sid"    = "allowloggroupcreation"
    "effect" = "Allow"

    "actions" = [
      "logs:CreateLogGroup",
    ]

    "resources" = [
      "arn:aws:logs:eu-west-2:${data.aws_caller_identity.current.account_id}:*"
    ]
  }
  "statement" {
    "sid"    = "allowlogstreamcreation"
    "effect" = "Allow"

    "actions" = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams"
    ]

    "resources" = [
      "arn:aws:logs:*:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.log_group_name}:*",
      "arn:aws:logs:*:${data.aws_caller_identity.current.account_id}:log-group:${var.log_group_name}:*"
    ]
  }
}

data "aws_iam_policy_document" "lambda_assume_role" {
  "statement" {
    "sid"    = "allowassumerolepermission"
    "effect" = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    "actions" = [
      "sts:AssumeRole"
    ]
  }
}

data "aws_iam_policy_document" "sns_policy" {
  "statement" {
    "sid"    = "allowsnspermissions"
    "effect" = "Allow"

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    "actions" = [
        "SNS:Publish",
        "SNS:RemovePermission",
        "SNS:SetTopicAttributes",
        "SNS:DeleteTopic",
        "SNS:ListSubscriptionsByTopic",
        "SNS:GetTopicAttributes",
        "SNS:Receive",
        "SNS:AddPermission",
        "SNS:Subscribe"
    ]

    "resources" = [
      "arn:aws:sns:${var.aws_region}:668764830176:${var.service_name}-${var.aws_region}"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceOwner"

      values = [
        "668764830176",
      ]
    }
  }
  "statement" {
    "sid"    = "allowsnspublish"
    "effect" = "Allow"

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    "actions" = [
      "SNS:Publish"
    ]

    "resources" = [
      "arn:aws:sns:${var.aws_region}:668764830176:${var.service_name}-${var.aws_region}"
    ]
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"

      values = [
        "arn:aws:cloudwatch:eu-west-2:496277699172:alarm:*",
        "arn:aws:cloudwatch:eu-west-2:32424242424:alarm:*"
      ]
    }
  }
  "statement" {
    "sid"    = "allowsnsreceivesubscribe"
    "effect" = "Allow"

    principals {
      identifiers = ["arn:aws:iam::668764830176:root"]
      type        = "AWS"
    }

    "actions" = [
      "SNS:Subscribe",
      "SNS:Receive"
    ]

    "resources" = [
      "arn:aws:sns:${var.aws_region}:668764830176:${var.service_name}-${var.aws_region}"
    ]
  }
}