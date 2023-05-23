module "s3_staticweb" {
  source = "../../modules/s3_staticweb"

  module_name = var.project_name
  module_tag  = var.project_tags
  src_path    = var.src_path
}