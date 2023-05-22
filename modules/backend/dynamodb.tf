resource "aws_dynamodb_table" "dynamodb_table" {
  name = "${var.module_name}-backend"

  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.module_tags
}
