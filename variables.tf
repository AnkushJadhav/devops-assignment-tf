#VPC
variable "private_subnet_id_1" {
    default=""
  
}

#IAM Role
variable "nameprofileforec2"{
    default="ssm_excute_cmd"
}

variable "roleforEC2"{
    default="ssm-excute-role"
}

variable "namePolicy"{
    default="ssm-excute-policy"
}


#EC2
variable "environmentName"{
    default="dev"
}


variable "region"{
    default="us-east-1"
}
