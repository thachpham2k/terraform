variable "project_name" {
}

variable "project_tags" {
  type = map(any)
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