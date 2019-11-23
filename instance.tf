// AWS EC2 Instance
# 
/*
Comment toggle
//*/

///*

resource "aws_instance" "openbalena-vps" {
    instance_type = "t2.micro"
    ami = var.ami_id

    security_groups = ["${aws_security_group.edge_sg.id}"]
    key_name = aws_key_pair.openbalena.key_name
    subnet_id = "${aws_subnet.subnet-edge-1a.id}"
    user_data = "${file("scripts/user_data.sh")}"
    root_block_device {
        volume_type = "gp2"
        volume_size = "60"
        delete_on_termination = "true"
    }

    tags = var.edge_tags

}

resource "aws_key_pair" "openbalena" {
    key_name = "openbalena"
    public_key = file("~/.ssh/openbalena.pub")
}
//*/