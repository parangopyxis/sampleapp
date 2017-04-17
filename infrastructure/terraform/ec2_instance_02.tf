resource "aws_instance" "EC2_2" {
	ami = "${lookup(var.ami, "id")}"
	instance_type = "${lookup(var.ami, "type")}"
	tags = {
		Name = "EC2 Instance 02"
	}
	key_name = "EC2_key_pair"
	vpc_security_group_ids = ["${aws_security_group.ec2_access_sg.id}"]
	subnet_id = "${aws_subnet.workshop_subnet_2.id}"

	#provisioners
	provisioner "local-exec" {
		command = "echo ${aws_instance.EC2_2.public_ip}"
	}

}

resource "aws_eip" "EC2_2_ip" {
    instance = "${aws_instance.EC2_2.id}"
}