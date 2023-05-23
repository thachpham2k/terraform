variable "module_name" {
  description = "Name of module."
  default     = "s3-staticweb"
}

variable "module_tag" {
  description = "Tags for resource create by module"
  type        = map(any)
  default = {
    "purpose" = "s3 static web"
    "author"  = "terraform"
  }
}

variable "src_path" {
  description = "File in this folder will be upload to s3 bucket"
  default     = null
}