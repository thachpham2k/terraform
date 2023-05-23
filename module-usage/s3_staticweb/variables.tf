variable "project_name" {
  description = "Name of project"
  default     = "s3-static-web"
}

variable "project_tags" {
  description = "Tags for AWS resource created by terraform"
  type        = map(any)
  default = {
    "purpose" = "s3-staticweb"
    "author"  = "terraform"
  }
}

variable "src_path" {
  description = "File in this folder will be upload to s3 bucket"
}