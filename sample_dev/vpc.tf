provider "aws" {
  region = "${lookup(var.aws_region, "${var.project_code}_${var.env}")}"
}

resource "aws_vpc" "main" {
  cidr_block = "10.${lookup(var.project_num, "${var.project_code}_${var.env}")}.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_code}_${var.env}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_code}-${var.env}-main"
  }
}

resource "aws_vpc_dhcp_options" "internal" {
  domain_name = "${var.project_code}-${var.env}.${lookup(var.aws_region_name, "${var.project_code}_${var.env}")}.aws"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags {
    Name = "${var.project_code}-${var.env}.${lookup(var.aws_region_name, "${var.project_code}_${var.env}")}.aws"
  }
}

resource "aws_vpc_dhcp_options_association" "internal" {
  vpc_id = "${aws_vpc.main.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.internal.id}"
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name = "${var.project_code}-${var.env}-main"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}

# NOTE: private domain
resource "aws_route53_zone" "private" {
  name = "${var.project_code}-${var.env}.${lookup(var.aws_region_name, "${var.project_code}_${var.env}")}.aws"
  vpc {
    vpc_id = "${aws_vpc.main.id}"
  }
}
