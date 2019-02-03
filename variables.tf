# NOTE: cidrがかぶらないようにここで一元管理

variable "project_num" {
  type = "map"

  # NOTE: 0-255: cidrの 10.x.0.0/16 のx部分
  default = {
    sample_prd = "0"
    sample_stg = "1"
    sample_dev = "2"
  }
}

variable "aws_region" {
  type = "map"

  default = {
    sample_prd = "ap-northeast-1"
    sample_stg = "ap-northeast-1"
    sample_dev = "ap-northeast-1"
  }
}

# NOTE: ap-northeast-1のまま使ってもいいけど、長いのでshortnameを用意
variable "aws_region_name" {
  type = "map"

  default = {
    sample_prd = "tokyo"
    sample_stg = "tokyo"
    sample_dev = "tokyo"
  }
}

