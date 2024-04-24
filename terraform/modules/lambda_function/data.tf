data "archive_file" "zip" {
  type        = "zip"
  output_path = "ddos_to_qradar.zip"

  source {
    content  = "${file("${path.module}/../../../ddos_to_qradar/ddos_lambda.py")}"
    filename = "ddos_lambda.py"
  }
}
