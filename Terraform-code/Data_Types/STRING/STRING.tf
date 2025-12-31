provider "aws" {
  region = "eu-west-1"
}


variable "username" {
  type    = string
  
}

resource "aws_iam_user" "user" {
  name = var.username
}
