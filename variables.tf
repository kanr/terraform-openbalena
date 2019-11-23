
variable "name" {
    default = "openbalena-controller"
}

variable "ami_id" {
    type = string
    default = "ami-08b314ce48a790a19"
}

variable "edge_tags" {
    type = map
    default = {"Name":"edge", "Environment":"Production"}
}

variable "availability_zone_names" {
    type = list
    default = [ "us-east-1a"]
}

variable "ssh_key_pair_name" {
    default = "openbalena"
}

variable "ingress_cidr_block" {
    type = "list"
    default = [ "0.0.0.0/0" ]
}