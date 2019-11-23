//vpc.tf

/*
    edge VPC
*/


resource "aws_default_vpc" "default"{
    // cidr_block = "10.0.0.0/16"
    // instance_tenancy = "dedicated"
    // name = "default"

    tags = var.edge_tags
}

///*
//network.tf
resource "aws_vpc" "edge" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = var.edge_tags
}

resource "aws_eip" "main" {
  instance = "${aws_instance.openbalena-vps.id}"
  vpc      = true
}
//*/