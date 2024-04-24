resource "aws_iam_role" "iam_role" {
  name               = "${var.iam_role_name}"
  path               = "/service-role/"
  assume_role_policy = "${var.iam_role_assume_service_policy}"
  tags               = "${var.tags}"
}

resource "aws_iam_policy" "iam_policy" {
  name               = "${var.iam_policy_name}"
  description = "abcd custom policy for ${var.iam_policy_name}"
  policy      = "${var.iam_policy_document}"
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count      = "${length(var.iam_role_policy_arn)}"
  policy_arn = "${element(var.iam_role_policy_arn, count.index)}"
  role       = "${aws_iam_role.iam_role.name}"
  depends_on = ["aws_iam_role.iam_role", "aws_iam_policy.iam_policy"]
}

resource "aws_iam_role_policy_attachment" "iam_custom_policy_attachment" {
  policy_arn = "${aws_iam_policy.iam_policy.arn}"
  role       = "${aws_iam_role.iam_role.name}"
  depends_on = ["aws_iam_role.iam_role", "aws_iam_policy.iam_policy"]
}
