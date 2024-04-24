resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = "${var.cloudwatch_log_group_name}"
  retention_in_days = "${var.retention_period}"
  tags              = "${var.tags}"
}

resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream" {
  name           = "${var.cloudwatch_log_stream_name}"
  log_group_name = "${aws_cloudwatch_log_group.cloudwatch_log_group.name}"
}
