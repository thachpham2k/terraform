resource "aws_instance" "natinstance" {
    instance_type = "t2.micro"
    ami = data.aws_ami.ami-natinstance.id
    subnet_id = var.natintance-subnet-id
    security_groups = [aws_security_group.sgr-natinstance.id]
    source_dest_check = false
    associate_public_ip_address = true
    tags = { 
        Name = "${var.project-name}-nat-instance"
    }
}