resource "aws_cloudwatch_event_rule" "event_rule" {
  name        = "${var.event_rule_name}"
  description = "${var.event_rule_description}"

  event_pattern = <<PATTERN
{
  "detail-type": [
    "DDOS Finding"
    ]  
}
PATTERN
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule = "${aws_cloudwatch_event_rule.event_rule.name}"
  arn  = "${var.target_lambda_arn}"
}
