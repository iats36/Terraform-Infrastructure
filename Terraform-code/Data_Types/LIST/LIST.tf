provider "aws" {
  region = "eu-west-1"
}


variable "iam_users" {
  type    = list(string)
 
}

resource "aws_iam_user" "users" {
  count = length(var.iam_users)
  name  = var.iam_users[count.index]
}

# HOW TO USE:
# Run this command from a terminal in this folder:
# terraform apply -auto-approve -var 'iam_users=["name","name","name","name"]'
