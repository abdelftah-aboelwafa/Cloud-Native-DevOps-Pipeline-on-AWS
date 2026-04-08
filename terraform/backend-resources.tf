terraform {
  backend "s3" {
    bucket         = "my-terraform-states"
    key            = "project/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
  }
}