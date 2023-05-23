resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.module_name}-s3-${substr(random_uuid.s3_uuid.result, 0, 5)}"
  tags   = var.module_tag
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  acl        = "public-read"
  depends_on = [aws_s3_bucket.s3_bucket, aws_s3_bucket_ownership_controls.s3_bucket, aws_s3_bucket_public_access_block.s3_bucket]
}

resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = templatefile("${path.root}/${path.module}/s3_policy.json.tpl", {
    bucket_name = "${aws_s3_bucket.s3_bucket.bucket}"
  })
  depends_on = [aws_s3_bucket.s3_bucket, aws_s3_bucket_acl.s3_bucket]
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}