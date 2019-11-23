//gateways.tf
resource "aws_internet_gateway" "edge-gw" {
  vpc_id = "${aws_vpc.edge.id}"

tags = var.edge_tags

}
