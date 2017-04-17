resource "aws_security_group" "elb_access_sg" {
  name = "elb_access"
  description = "Gives access to the ELB through HTTP 80"
  vpc_id = "${aws_vpc.workshop_vpc.id}"
  tags = {
    Name = "elb_access"
  }

  ingress = {
    from_port = "80"
    to_port = "80"
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