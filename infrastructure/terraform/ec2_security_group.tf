resource "aws_security_group" "ec2_access_sg" {
	name = "ec2_access"
	description = "grants access to ssh port 22"
	vpc_id = "${aws_vpc.workshop_vpc.id}"
	tags = {
		Name = "ec2_access"
	}
	
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
}