output "log_grp_arn" {
  value = "${aws_cloudwatch_log_group.cloudwatch_log_group.arn}"
}

output "log_grp_name" {
  value = "${aws_cloudwatch_log_group.cloudwatch_log_group.name}"
}
