output "s3_webdomain" {
  value = aws_s3_bucket_website_configuration.s3_bucket.website_endpoint
}

output "s3_bucket" {
  value = aws_s3_bucket.s3_bucket
}