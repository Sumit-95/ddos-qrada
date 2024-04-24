resource "aws_iam_role" "iam_role" {
  name               = "${var.iam_role_name}"
  path               = "/service-role/"
  assume_role_policy = "${var.iam_role_assume_service_policy}"
  tags               = "${var.tags}"
}

resource "aws_iam_policy" "iam_policy" {
  count       = "${length(var.iam_role_custom_policy)}"
  name        = "${element(keys(var.iam_role_custom_policy), count.index)}"
  description = "abcd custom policy for ${element(keys(var.iam_role_custom_policy), count.index)}"
  policy      = "${element(values(var.iam_role_custom_policy), count.index)}"
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count      = "${length(var.iam_role_policy_arn)}"
  policy_arn = "${element(var.iam_role_policy_arn, count.index)}"
  role       = "${aws_iam_role.iam_role.name}"
  depends_on = ["aws_iam_role.iam_role", "aws_iam_policy.iam_policy"]
}

resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  user       = "${aws_iam_user.iam_user.name}"
  policy_arn = "${var.iam_user_policy_arn}"
}
