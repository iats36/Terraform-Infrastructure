provider "aws" {
  region = "eu-west-1"
}

variable "is_admin" {
  description = "If true, attach AdministratorAccess. If false, attach ReadOnlyAccess."
  type        = bool
  default = true
}

resource "aws_iam_user" "demo_user" {
  name = "selam"
}

resource "aws_iam_user_policy_attachment" "admin" {
  count      = var.is_admin ? 1 : 0
  user       = aws_iam_user.demo_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "readonly" {
  count      = var.is_admin ? 0 : 1
  user       = aws_iam_user.demo_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


#the dafult is true so admin but if false nedded for instance
#terraform apply -var="is_admin=false"



