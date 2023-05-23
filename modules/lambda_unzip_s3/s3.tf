resource "aws_s3_bucket" "s3_bucket" {
  count  = var.has_existed_s3 ? 0 : 1
  bucket = local.s3_bucket_name

  tags = var.module_tags
}

resource "aws_s3_bucket_notification" "s3_bucket_notify" {
  bucket = var.has_existed_s3 ? var.s3_bucket_name : aws_s3_bucket.s3_bucket[0].id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda_function.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".zip"
  }

  depends_on = [aws_s3_bucket.s3_bucket]
}