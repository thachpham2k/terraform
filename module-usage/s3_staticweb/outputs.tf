output "s3-bucket-name" {
  value = module.s3_staticweb.s3_bucket.id
}

output "s3_webdomain" {
  value = module.s3_staticweb.s3_webdomain
}