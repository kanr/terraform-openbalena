//subnets.tf

/*
    Requires a VPC 
*/
resource "aws_subnet" "subnet-edge-1a" {
  cidr_block = "${cidrsubnet(aws_vpc.edge.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.edge.id}"
  availability_zone = "us-east-1a"
}

resource "aws_route_table" "route-table-edge" {
  vpc_id = "${aws_vpc.edge.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.edge-gw.id}"
    }
    tags = var.edge_tags
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet-edge-1a.id}"
  route_table_id = "${aws_route_table.route-table-edge.id}"
}