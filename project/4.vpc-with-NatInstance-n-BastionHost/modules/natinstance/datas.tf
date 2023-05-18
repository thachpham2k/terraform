data "aws_ami" "ami-natinstance" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat*"]
  }
}