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