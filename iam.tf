resource "aws_iam_role" "canary" {
  name               = "cp-canary-${var.canary_name}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.canary_assume.json
}

resource "aws_iam_role_policy_attachment" "canary" {
  role       = aws_iam_role.canary.name
  policy_arn = aws_iam_policy.canary.arn
}

data "aws_iam_policy_document" "canary_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "canary" {
  name        = "cp-canary-${var.canary_name}"
  description = "Synthetics Canary policy"
  policy      = data.aws_iam_policy_document.canary.json
}

data "aws_iam_policy_document" "canary" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:s3:::${var.canary_bucket}"]
    actions   = ["s3:PutObject"]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:s3:::${var.canary_bucket}"]
    actions   = ["s3:GetBucketLocation"]
  }

}
