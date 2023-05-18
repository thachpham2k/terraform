data "aws_availability_zones" "availability-zone" {
  state = "available"
  filter {
    name   = "region-name"
    values = [var.region]
  }
}