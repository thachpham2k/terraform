data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_role" {
  name               = "${title(var.module_name)}-lambda_Role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.module_tags
}

resource "aws_iam_policy" "iam_policy" {
  name        = "${var.module_name}-iam_policy_4_lambda_role"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:*"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_policy_2_role" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}
