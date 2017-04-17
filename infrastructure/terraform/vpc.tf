resource "aws_vpc" "workshop_vpc" {
  cidr_block = "172.31.0.0/16"
  enable_dns_hostnames = 1
  enable_dns_support = 1
  tags = {
    Name = "workshop_vpc"
  }
}

resource "aws_main_route_table_association" "roa" {
  route_table_id = "${aws_route_table.workshop_route_tb.id}"
  vpc_id = "${aws_vpc.workshop_vpc.id}"
}