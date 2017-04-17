resource "aws_route_table" "workshop_route_tb" {
  vpc_id = "${aws_vpc.workshop_vpc.id}"
  tags = {
    Name = "workshop_route_tb"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = "${aws_subnet.workshop_subnet.id}"
  route_table_id = "${aws_route_table.workshop_route_tb.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id = "${aws_subnet.workshop_subnet_2.id}"
  route_table_id = "${aws_route_table.workshop_route_tb.id}"
}