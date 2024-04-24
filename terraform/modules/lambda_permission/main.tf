resource "aws_lambda_permission" "with_sns" {
    statement_id = "allow-execution-from-sns-${var.aws_region}"
    action = "lambda:InvokeFunction"
    function_name = "${var.lambda_arn}"
    principal = "sns.amazonaws.com"
    source_arn = "${var.source_arn}"
}
