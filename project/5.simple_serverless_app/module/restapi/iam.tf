# Lambda role
data "aws_iam_policy_document" "lambda-assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda-iam_role" {
  name               = "${var.project_name}-lambda_Role"
  assume_role_policy = data.aws_iam_policy_document.lambda-assume_role.json

  tags = var.project_tags
}

resource "aws_iam_policy" "lambda-iam_policy" {
  name        = "${var.project_name}-iam_policy_4_lambda_role"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy      = templatefile("lambda_policy.json.tpl", {})
}

resource "aws_iam_role_policy_attachment" "lambda-attach_policy_2_role" {
  role       = aws_iam_role.lambda-iam_role.name
  policy_arn = aws_iam_policy.lambda-iam_policy.arn
}

# API Gateway role
data "aws_iam_policy_document" "apigw-assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "apigw-iam_role" {
  name               = "${var.project_name}-apigw_Role"
  assume_role_policy = data.aws_iam_policy_document.apigw-assume_role.json

  tags = var.project_tags
}

resource "aws_iam_policy" "apigw-iam_policy" {
  name        = "${var.project_name}-iam_policy_4_apigw_role"
  path        = "/"
  description = "AWS IAM Policy for managing aws api gateway role"
  policy      = templatefile("apigateway_policy.json.tpl", {})
}

resource "aws_iam_role_policy_attachment" "lambda-attach_policy_2_role" {
  role       = aws_iam_role.apigw-iam_role.name
  policy_arn = aws_iam_policy.apigw-iam_policy.arn
}

