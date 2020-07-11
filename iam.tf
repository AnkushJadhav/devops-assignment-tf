resource "aws_iam_role" "generateLambdaRoles" {

  name  = "lambda_execute_ssm_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "managed-policy1" {
  role      = "${aws_iam_role.generateLambdaRoles.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "managed-policy2" {
  role      = "${aws_iam_role.generateLambdaRoles.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
}

resource "aws_iam_role_policy_attachment" "managed-policy3" {
  role      = "${aws_iam_role.generateLambdaRoles.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_instance_profile" "profileforEC2" {
  name = "${var.nameprofileforec2}"
  role = "${aws_iam_role.roleforEC2.name}"
}

resource "aws_iam_role" "roleforEC2" {
  name = "${var.roleforEC2}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "managed-policy4" {
  role      = "${aws_iam_role.roleforEC2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

