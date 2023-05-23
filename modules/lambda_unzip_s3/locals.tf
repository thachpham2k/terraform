# data "aws_s3_bucket" "s3_bucket" {
#   # count = var.has_existed_s3?1:0
#   bucket = var.s3_bucket_name
# }

locals {
  s3_bucket_name = (var.s3_bucket_name == null) ? "${var.module_name}-s3-${substr(random_uuid.s3_uuid.result, 0, 5)}" : var.s3_bucket_name
}