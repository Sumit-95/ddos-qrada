resource "aws_sns_topic" "ddos_topic" {
  name = "${var.service_name}-${var.aws_region}"
  policy = "${var.snspolicy}"
  tags = "${var.tags}"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}

resource "aws_sns_topic_subscription" "topic_lambda" {
  topic_arn = "${aws_sns_topic.ddos_topic.arn}"
  protocol  = "lambda"
  endpoint  = "${var.lambda_arn}"
}

