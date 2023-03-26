# resource "aws_eip" "eip-4natgw" {
#   vpc = true
# }

# resource "aws_nat_gateway" "natgateway" {
#   allocation_id = aws_eip.eip-4natgw.id
#   subnet_id     = aws_subnet.publicsubnet[0].id

#   depends_on = [aws_subnet.publicsubnet[0]]

#   tags = {
#     "Name" = "${var.project-name}-natgateway"
#   }
# }

# resource "aws_instance" "natinstance" {
#   instance_type = "t2.micro"
#   ami = data.aws_ami.natinstance.id
#   subnet_id = aws_subnet.lab4publicsubnet.id
#   security_groups = [aws_security_group.lab4sgrnatinstance.id]
#   source_dest_check = false
#   associate_public_ip_address = true
#   tags = { Name = "terraform-nat-instance" }
# }