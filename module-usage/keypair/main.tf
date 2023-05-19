module "keypair" {
  source = "../../modules/keypair"

  key_name = var.key_name
  key_path = var.key_path
}