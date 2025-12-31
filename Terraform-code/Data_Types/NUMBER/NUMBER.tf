provider "aws" {
  region = "eu-west-1"
}

variable "bucket_count" {
  description = "How many S3 buckets to create"
  type        = number
  default     = 1
}

resource "aws_s3_bucket" "demo" {
  count  = var.bucket_count
  bucket = "esu-s3-bucket-${count.index + 1}"
}

#if 3 s3 buckts needed  terraform apply -var="bucket_count=3"
