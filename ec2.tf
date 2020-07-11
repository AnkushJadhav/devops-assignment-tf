
variable "key_name" {}

resource "tls_private_key" "createcert" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2key" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.createcert.public_key_openssh}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "launchEC2" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id = "${data.aws_subnet.subnet-selected1.id}"
  vpc_security_group_ids = ["${aws_security_group.sg1.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.profileforEC2.name}"
  key_name ="${aws_key_pair.ec2key.key_name}"

  tags = {
    Name = "Test_SSM"
    environment = "${var.environmentName}"
  }
}