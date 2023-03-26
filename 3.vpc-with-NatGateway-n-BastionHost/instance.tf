# Instance
resource "aws_instance" "private-instance" {
  instance_type           = "t2.micro"
  ami                     = data.aws_ami.ubuntu.id
  subnet_id               = module.vpc.privatesubnet0-id
  security_groups         = [aws_security_group.sgr-sshall.id]
  key_name                = module.sshkeypair.sshkeypair-name
  disable_api_termination = false
  ebs_optimized           = false
  tags = {
    "Name" = "${var.project-name}-private-instance"
  }
}

resource "aws_instance" "bastionhost" {
  instance_type               = "t2.micro"
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = module.vpc.publicsubnet0-id
  security_groups             = [aws_security_group.sgr-sshall.id]
  key_name                    = module.sshkeypair.sshkeypair-name
  associate_public_ip_address = true
  disable_api_termination     = false
  ebs_optimized               = false
  tags = {
    "Name" = "${var.project-name}-public-instance"
  }
}