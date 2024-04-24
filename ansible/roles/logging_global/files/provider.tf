provider "aws" {
  insecure = true
  region   = "${var.aws_region}"
}
