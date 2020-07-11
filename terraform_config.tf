terraform {
 backend "s3" {
 encrypt = true
 bucket = "dev-trs-storage"
 dynamodb_table = "dev-terraform-state-lock-dynamo"
 region = "us-east-1"
 key = "lambda-ssm/terraform.tfstate"
 }
}