terraform {
  backend "s3" {
    bucket  = "bucket-tanarky-sample-dev"
    key     = "manual_ec2/terraform.tfstate"
    region  = "ap-northeast-1"
  }
}

variable "ec2_key_name" {
  default = ""
}
