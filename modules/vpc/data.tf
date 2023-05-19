data "aws_availability_zones" "availability_zone" {
  state = "available"
  filter {
    name   = "region-name"
    values = [var.region]
  }
}