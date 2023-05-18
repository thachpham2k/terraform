resource "aws_security_group" "sgr-sshall" {
  description = "allow ssh connection from all resource"
  vpc_id      = module.vpc.vpc-id
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
  tags = {
    "Name" = "terraform-sgr-ssh-all"
  }
}