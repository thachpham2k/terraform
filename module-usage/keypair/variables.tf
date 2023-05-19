variable "key_name" {
  description = "Name of keypair. Eg: terraform -> keypair: terraform-keypair"
  default     = "terraform"
}

variable "key_path" {
  description = "Where keypair file saved"
  default     = ""
}

variable "key_tags" {
  description = "Key tags"
  type        = map(any)
  default = {
    "purpose" : "keypair-project"
    "author" : "terraform"
  }
}