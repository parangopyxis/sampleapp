resource "aws_route" "inet_route" {
  route_table_id = "${aws_route_table.workshop_route_tb.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.workshop_inet_gw.id}"
}