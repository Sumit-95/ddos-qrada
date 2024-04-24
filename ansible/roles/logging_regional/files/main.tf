module "sns"{
  source = "../../../modules/sns_topic"
  snspolicy = "${data.aws_iam_policy_document.sns_policy.json}"
  aws_region = "${var.aws_region}"
  tags                           = "${local.common_tags}"
  lambda_arn = "${local.lambda_arn}"
  service_name = "${var.service_name}"
}

module "lambda_permission"{
  source = "../../../modules/lambda_permission"
  lambda_arn = "${local.lambda_arn}"
  source_arn = "${module.sns.sns_arn}"
  aws_region = "${var.aws_region}"
  providers = {
    "aws" = "aws.london"
  }
}
