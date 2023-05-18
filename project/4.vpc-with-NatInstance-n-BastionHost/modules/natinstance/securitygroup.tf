resource "aws_security_group" "sgr-natinstance" {
  description = "allow all traffic from private subnet"
  vpc_id      = var.vpc-id

  dynamic "ingress" {
    # for_each = { for k, v in var.private-subnet : k => v }
    for_each = var.private-subnet
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["${ingress.value.cidr_block}"]
    }
  }
  # ingress {
  #     cidr_blocks = [aws_subnet.privatesubnet.cidr_block]
  #     from_port = 0
  #     to_port = 0
  #     protocol = "-1" 
  # }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  tags = {
    "Name" = "${var.project-name}-sgr-natinstance"
  }
}