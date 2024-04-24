output "sns_arn" {
  value = "${aws_sns_topic.ddos_topic.arn}"
}
