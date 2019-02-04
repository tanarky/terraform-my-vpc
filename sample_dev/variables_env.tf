# NOTE: provider, project_code, env はvariables_envで定義する
provider "aws" {
  version = "~> 1.57"
  region  = "${lookup(var.aws_region, "${var.project_code}_${var.env}")}"
}

variable "project_code" {
  default = "sample"
}

variable "env" {
  default = "dev"
}

