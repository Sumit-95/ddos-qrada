provider "aws" {
  insecure = true
  region   = "${var.aws_region}"
}

provider "aws" {
  insecure = true
  alias = "london"
  region   = "eu-west-2"
}
