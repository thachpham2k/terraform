terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = local.region
}

locals {
  region = "ap-southeast-1"
}

module "lambda" {
  source = "../../modules/lambda_unzip_s3"

  module_name    = var.project_name
  module_tags    = var.project_tags
  has_existed_s3 = var.has_existed_s3
  s3_bucket_name = var.s3_bucket_name
}