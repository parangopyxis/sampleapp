resource "aws_subnet" "workshop_subnet" {
  vpc_id = "${aws_vpc.workshop_vpc.id}"
  availability_zone = "${var.aws_availability_zone_1}"
  cidr_block = "172.31.240.0/24"
  map_public_ip_on_launch = 1
  tags = {
    Name = "workshop_subnet"
  }
}