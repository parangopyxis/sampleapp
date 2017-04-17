output "EC2_2.ip" {
  value ="${aws_instance.EC2_2.public_ip}"
}

output "EC_2.dns" {
  value = "${aws_instance.EC2_2.public_dns}"
}

output "EC2_1.ip" {
  value = "${aws_instance.EC2_1.public_ip}"
}

output "EC2_1.dns" {
  value = "${aws_instance.EC2_1.public_dns}"
}

output "elb_1.dns" {
  value = "${aws_elb.elb_1.dns_name}"
}