resource "aws_subnet" "public_a" {
  availability_zone       = "${lookup(var.aws_region, "${var.project_code}_${var.env}")}a"
  cidr_block              = "10.${lookup(var.project_num, "${var.project_code}_${var.env}")}.0.0/24"
  vpc_id                  = "${aws_vpc.main.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_code}-${var.env}-public-a"
  }
}

resource "aws_subnet" "public_c" {
  availability_zone       = "${lookup(var.aws_region, "${var.project_code}_${var.env}")}c"
  cidr_block              = "10.${lookup(var.project_num, "${var.project_code}_${var.env}")}.1.0/24"
  vpc_id                  = "${aws_vpc.main.id}"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_code}-${var.env}-public-c"
  }
}

resource "aws_subnet" "private_a" {
  availability_zone = "${lookup(var.aws_region, "${var.project_code}_${var.env}")}a"
  cidr_block = "10.${lookup(var.project_num, "${var.project_code}_${var.env}")}.2.0/24"
  vpc_id     = "${aws_vpc.main.id}"
  tags = {
    Name = "${var.project_code}-${var.env}-private-a"
  }
}

resource "aws_subnet" "private_c" {
  availability_zone = "${lookup(var.aws_region, "${var.project_code}_${var.env}")}c"
  cidr_block = "10.${lookup(var.project_num, "${var.project_code}_${var.env}")}.3.0/24"
  vpc_id     = "${aws_vpc.main.id}"
  tags = {
    Name = "${var.project_code}-${var.env}-private-c"
  }
}

resource "aws_eip" "eip" {
  tags = {
    Name = "${var.project_code}-${var.env}-natgw-eip"
  }
}

resource "aws_nat_gateway" "natgw_a" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.public_a.id}"
  tags = {
    Name = "${var.project_code}-${var.env}-natgw-a"
  }
}

resource "aws_route_table" "natgw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "${var.project_code}-${var.env}-natgw"
  }
}

resource "aws_route" "natgw" {
  route_table_id         = "${aws_route_table.natgw.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.natgw_a.id}"
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = "${aws_subnet.private_a.id}"
  route_table_id = "${aws_route_table.natgw.id}"
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = "${aws_subnet.private_c.id}"
  route_table_id = "${aws_route_table.natgw.id}"
}
