#list of ingress rules
resource "aws_network_acl_rule" "workshop_net_acl_allow_http_in" {
  network_acl_id = "${aws_vpc.workshop_vpc.default_network_acl_id}"
  rule_number = 200
  rule_action = "allow"
  from_port = 80
  to_port =  80
  protocol = "tcp"
  cidr_block = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "workshop_net_acl_allow_ssh_in" {
  network_acl_id = "${aws_vpc.workshop_vpc.default_network_acl_id}"
  rule_number = 300
  rule_action = "allow"
  from_port = 22
  to_port =  22
  protocol = "tcp"
  cidr_block = "0.0.0.0/0"
}
#list of egress rules
resource "aws_network_acl_rule" "workshop_net_acl_allow_all_out" {
  network_acl_id = "${aws_vpc.workshop_vpc.default_network_acl_id}"
  rule_number = 100
  egress = "true"
  rule_action = "allow"
  protocol = "-1"
  cidr_block = "0.0.0.0/0"
}