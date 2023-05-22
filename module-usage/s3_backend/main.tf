module "s3backend" {
  source = "../../modules/backend"

  module_name    = var.name_prefix
  module_tags    = var.tags
  principal_arns = var.principal_arns
}