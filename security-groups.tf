resource "aws_default_security_group" "default" {
    vpc_id = "${aws_vpc.edge.id}"
    
//     ingress {
//         protocol  = "-1"
//         self      = true
//         from_port = 0
//         to_port   = 0
//     }
//     egress {
//         from_port   = 0
//         to_port     = 0
//         protocol    = "-1"
//         cidr_blocks = "${var.ingress_cidr_block}"
//   }
    tags = var.edge_tags

}


resource "aws_security_group" "edge_sg" {
    name = "edge_sg"
    description = "Openbalena Controller Security Group"
    vpc_id = "${aws_vpc.edge.id}"
}

resource "aws_security_group_rule" "allow_ssh" {
    description = "Allow inboud ssh connection on port 22"
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

#for letsencrypt
resource "aws_security_group_rule" "custom_inboud_rule_11" {
    description = ""
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}
#for letsencrypt
resource "aws_security_group_rule" "custom_inboud_rule_12" {
    description = ""
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_outboud_rule_1" {
    description = "Outbound Traffic "
    type = "egress"
    from_port = 0
    to_port = 65535
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.edge_sg.id}"
}

/*
resource "aws_security_group_rule" "custom_inboud_rule_1" {
    description = "Port used for device and controller communication"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_2" {
    description = "Port used for controller GUI/API"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_3" {
    description = "Port used for HTTPS portal redirection"
    type = "ingress"
    from_port = 8843
    to_port = 8843
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_4" {
    description = "Port used for HTTP portal redirection"
    type = "ingress"
    from_port = 8880
    to_port = 8880
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_5" {
    description = "Port used for unifi mobile speed test"
    type = "ingress"
    from_port = 6789
    to_port = 6789
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_6" {
    description = "Port used for STUN"
    type = "ingress"
    from_port = 3478
    to_port = 3478
    protocol = "udp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_7" {
    description = "Ports used for AP-EDU broadcasting"
    type = "ingress"
    from_port = 5656
    to_port = 5699
    protocol = "udp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_8" {
    description = "Port used for local-bound database communication"
    type = "ingress"
    from_port = 27117
    to_port = 27117
    protocol = "tcp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_9" {
    description = "Ports used for AP discovery"
    type = "ingress"
    from_port = 10001
    to_port = 10001
    protocol = "udp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_inboud_rule_10" {
    description = "Ports used for setting -Make controller discoverable on L2 network- in controller setting"
    type = "ingress"
    from_port = 1900
    to_port = 1900
    protocol = "udp"
    cidr_blocks = "${var.ingress_cidr_block}"
    security_group_id = "${aws_security_group.edge_sg.id}"
}

resource "aws_security_group_rule" "custom_outboud_rule_1" {
    description = "Custom TCP Rule "
    type = "egress"
    from_port = 0
    to_port = 65535
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.edge_sg.id}"
}
*/