resource "aws_security_group_rule" "ec2_elb_access_sg" {
  type = "ingress"
  from_port = 4567
  to_port = 4567
  protocol = "tcp"
  security_group_id = "${aws_security_group.ec2_access_sg.id}"
  source_security_group_id = "${aws_security_group.elb_access_sg.id}"
}