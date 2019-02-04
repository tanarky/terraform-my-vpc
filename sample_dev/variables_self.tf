# NOTE: remote stateの場合、変数参照できない
terraform {
  backend "s3" {
    bucket  = "bucket-tanarky-sample-dev"
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
  }
}
