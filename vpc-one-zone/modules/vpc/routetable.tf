resource "aws_route_table" "route-table-privatesubnet" {
    vpc_id = aws_vpc.vpc.id
    tags = { 
        "Name" = "${var.project-name}-routetable-for-privatesubnet" 
    }
}

resource "aws_route_table_association" "route-table-association-privatesubnet" { 
    subnet_id = aws_subnet.privatesubnet.id
    route_table_id = aws_route_table.route-table-privatesubnet.id
}

resource "aws_route_table" "route-table-publicsubnet" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id
    }
    tags = { 
        "Name" = "${var.project-name}-routetable-for-publicsubnet" 
    }
}
resource "aws_route_table_association" "route-table-association-publicsubnet" { 
    subnet_id = aws_subnet.publicsubnet.id
    route_table_id = aws_route_table.route-table-publicsubnet.id
}