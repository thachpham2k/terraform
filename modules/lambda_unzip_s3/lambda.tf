data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/lambda_function/lambda_function.py"
  output_path = "${path.module}/lambda_function/lambda.zip"
}

resource "aws_lambda_function" "lambda_function" {
  filename         = "${path.module}/lambda_function/lambda.zip"
  function_name    = "lambda_function_name"
  role             = aws_iam_role.iam_role.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.9"

  tags = var.module_tags
}

resource "aws_lambda_permission" "test" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.has_existed_s3 ? var.s3_bucket_name : aws_s3_bucket.s3_bucket[0].id}"
}