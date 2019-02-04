data "terraform_remote_state" "sample_dev" {
  backend = "s3"

  config {
    bucket  = "bucket-tanarky-sample-dev"
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
  }
}
