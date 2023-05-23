variable "module_name" {
  description = "Name of module."
  default     = "unzip-lambda"
}

variable "module_tags" {
  description = "Tags for resource create by module"
  type        = map(any)
  default = {
    "purpose" = "lambda unzip file"
    "author"  = "terraform"
  }
}

variable "has_existed_s3" {
  description = "Do s3 bucket exist?"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "Name of s3 bucket"
  default     = null
}