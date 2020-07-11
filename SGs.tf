resource "aws_security_group" "sg1" {
  name = "test_ssm_sg"
  description = "Allow inbound traffic as Per Resource/Requirement"
  vpc_id = "${data.aws_subnet.subnet-selected1.vpc_id}"
  revoke_rules_on_delete = "true"
    egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
  }
    egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
  }

}