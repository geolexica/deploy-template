resource "aws_iam_user" "deploy" {
  provider = aws.main
  name     = "deploy-${replace(var.fqdn-main, ".", "-")}"
  path     = "/static-sites/"
}

resource "aws_iam_access_key" "deploy" {
  provider = aws.main
  user     = aws_iam_user.deploy.name
}

data "aws_iam_policy_document" "deploy_policy" {
  provider = aws.main

  statement {
    sid = "DeployAllAccess"

    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${var.fqdn-main}",
      "arn:aws:s3:::${var.fqdn-main}/*",
      "arn:aws:s3:::${var.fqdn-test}",
      "arn:aws:s3:::${var.fqdn-test}/*",
    ]
  }

  statement {
    sid       = "AllowCreateInvalidation"
    actions   = ["cloudfront:CreateInvalidation"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "deploy_policy" {
  provider = aws.main
  name     = "deploy-${replace(var.fqdn-main, ".", "-")}-test_policy"
  user     = aws_iam_user.deploy.name

  policy = data.aws_iam_policy_document.deploy_policy.json
}

