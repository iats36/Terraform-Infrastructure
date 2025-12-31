provider "aws" {
  region = "eu-west-1"
}

variable "user_info" {
  type = map(string)
  default = {
    name = "Kylie"
    city = "london"
  }
}

resource "aws_iam_user" "demo_user" {
  name = var.user_info["name"]

  tags = {
    City = var.user_info["city"]
  }
}

output "user_name" {
  value = aws_iam_user.demo_user.name
}

output "user_city" {
  value = aws_iam_user.demo_user.tags["City"]
}
