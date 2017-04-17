resource "aws_internet_gateway" "workshop_inet_gw" {
  vpc_id = "${aws_vpc.workshop_vpc.id}"
  tags = {
    Name = "workshop_inet_gw"
  }
}