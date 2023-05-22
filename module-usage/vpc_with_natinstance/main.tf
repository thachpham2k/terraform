module "vpc" {
  source             = "../../modules/vpc"
  region             = local.region
  module_tags        = var.tags
  module_name        = var.name_prefix
  vpc_cidr           = var.vpc_cidr
  number_of_az       = var.number_of_az
  has_public_subnet  = var.has_public_subnet
  has_private_subnet = var.has_private_subnet
  nat_az             = 1
  has_nat_gateway    = false
}

module "keypair" {
  source = "../../modules/keypair"

  key_name = var.name_prefix
  key_path = var.key_path
  key_tags = var.tags
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Ubuntu Server 22.04 LTS*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "sgr-sshall" {
  description = "allow ssh connection from all resource"
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  tags = merge({ Name = "terraform-sgr-ssh-all" }, var.tags)
}
# Instance
resource "aws_instance" "private-instance" {
  instance_type           = "t2.micro"
  ami                     = data.aws_ami.ubuntu.id
  subnet_id               = keys(module.vpc.privatesubnet)[0]
  security_groups         = [aws_security_group.sgr-sshall.id]
  key_name                = module.keypair.keypair-name
  disable_api_termination = false
  ebs_optimized           = false
  tags                    = merge({ Name = "${var.name_prefix}-private-instance" }, var.tags)
}

resource "aws_instance" "bastionhost" {
  instance_type               = "t2.micro"
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = keys(module.vpc.publicsubnet)[0]
  security_groups             = [aws_security_group.sgr-sshall.id]
  key_name                    = module.keypair.keypair-name
  associate_public_ip_address = true
  disable_api_termination     = false
  ebs_optimized               = false
  tags                        = merge({ Name = "${var.name_prefix}-bastionhost" }, var.tags)
}