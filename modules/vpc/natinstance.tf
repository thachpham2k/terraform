# data "aws_ami" "ami-natinstance" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = ["amzn-ami-vpc-nat*"]
#   }
# }

# resource "aws_instance" "natinstance" {
#   count = var.nat_gateway_az > 0 ? (var.has_nat_gateway == true ? 0 : 1) : 0

#   instance_type               = "t2.micro"
#   ami                         = data.aws_ami.ami-natinstance.id
#   subnet_id                   = var.natintance-subnet-id
#   security_groups             = [aws_security_group.sgr-natinstance.id]
#   source_dest_check           = false
#   associate_public_ip_address = true
#   tags = {
#     Name = "${var.project-name}-nat-instance"
#   }
# }

# resource "aws_security_group" "sgr-natinstance" {
#   description = "allow all traffic from private subnet"
#   vpc_id      = var.vpc-id

#   dynamic "ingress" {
#     # for_each = { for k, v in var.private-subnet : k => v }
#     for_each = var.private-subnet
#     content {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["${ingress.value.cidr_block}"]
#     }
#   }
#   # ingress {
#   #     cidr_blocks = [aws_subnet.privatesubnet.cidr_block]
#   #     from_port = 0
#   #     to_port = 0
#   #     protocol = "-1" 
#   # }
#   egress {
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#   }
#   tags = {
#     "Name" = "${var.project-name}-sgr-natinstance"
#   }
# }