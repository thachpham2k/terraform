# Module VPC
output "vpc-id" {
  value = module.vpc.vpc-id
}

output "privatesubnet-cidr" {
  value = module.vpc.privatesubnet-cidr
}

output "publicsubnet-cidr" {
  value = module.vpc.publicsubnet-cidr
}

output "availabilityzone" {
  value = module.vpc.availabilityzone
}

output "internetgateway" {
  value = module.vpc.internetgateway
}

# module sshkeypair

output "awssshkeypaipublic" {
  value     = module.sshkeypair.sshkeypairpublic
  sensitive = true
  # Dùng lệnh `terraform output -raw awssshkeypaipublic` để xem
}

output "awssshkeypaiprivate" {
  value = module.sshkeypair.sshkeypaiprivate
}

# main

output "private-instance-ip" {
  value = aws_instance.private-instance.private_ip
}

output "bastion-host-ip" {
  value = aws_instance.bastionhost.public_ip
}