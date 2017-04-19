variable "aws_access_key" {
	default = ""
}

variable "aws_secret_key" {
	default = ""
}

variable "aws_region" {
	default = "us-west-1"
}

variable "aws_availability_zone_1" {
	default = "us-west-1b"
}

variable "aws_availability_zone_2" {
	default = "us-west-1c"
}

variable "ami" {
	default {
		id = "ami-ff861c93"
		type = "t2.micro"
	}
}
