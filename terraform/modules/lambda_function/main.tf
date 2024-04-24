resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.lambda_function_name}"

  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  description                    = "A lambda function that modifies DDOS logs by adding an account name and adds the logs to a CloudWatch Log Group."
  role                           = "${var.role_arn}"
  handler                        = "ddos_lambda.lambda_handler"
  runtime                        = "python3.7"
  timeout                        = 120
  reserved_concurrent_executions = "100"

  tags = "${merge(var.tags, map("ApplicationName", "Ddos_QRadar"))}"

  environment {
    variables = "${var.lambda_env_vars}"
  }
}
