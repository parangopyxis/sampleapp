resource "aws_elb" "elb_1" {
  name = "WorkshopELB"

  listener = {
    instance_port = "4567"
    instance_protocol = "http"
    lb_port = "80"
    lb_protocol = "http"
  }

  health_check = {
    healthy_threshold = "2"
    unhealthy_threshold = "2"
    timeout = "3"
    target = "TCP:4567"
    interval = "10"
    timeout = "5"
  }

  security_groups = [
    "${aws_security_group.elb_access_sg.id}"]
  instances = [
    "${aws_instance.EC2_1.id}",
    "${aws_instance.EC2_2.id}"]
  subnets = [
    "${aws_subnet.workshop_subnet.id}",
    "${aws_subnet.workshop_subnet_2.id}"]
}