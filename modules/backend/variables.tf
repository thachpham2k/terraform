variable "module_name" {
  description = "Prefix of backend resource name."
  default     = "backend"
}

variable "module_tags" {
  description = "Module tags"
  type        = map(any)
  default = {
    "purpose" : "terraform_backend"
    "author" : "terraform"
  }
}

variable "principal_arns" {
  description = "A list of principal arns allowed to assume the IAM role"
  default     = null
  type        = list(string)
}