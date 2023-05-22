resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "${var.module_name}-${substr(random_uuid.s3_uuid.result, 0, 5)}-backend"
  force_destroy = false

  tags = var.module_tags
}

# resource "aws_s3_bucket_acl" "s3_bucket" {
#   bucket = aws_s3_bucket.s3_bucket.id
#   acl    = "private"
#   depends_on = [ aws_s3_bucket.s3_bucket ]
# }

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "kms_key" {
  tags = var.module_tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.kms_key.arn
    }
  }
}
