output "keypair-name" {
  value = module.keypair.keypair-name
}

output "keypairpublic" {
  value     = module.keypair.keypairpublic
}

output "keypaiprivate" {
  value = module.keypair.keypaiprivate
  sensitive = true
}

