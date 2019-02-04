output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "subnet_public_a" {
  value = "${aws_subnet.public_a.id}"
}

output "subnet_public_c" {
  value = "${aws_subnet.public_c.id}"
}

output "subnet_private_a" {
  value = "${aws_subnet.private_a.id}"
}

output "subnet_private_c" {
  value = "${aws_subnet.private_c.id}"
}

output "sg_allow_http_from_all" {
  value = "${aws_security_group.allow_http_from_all.id}"
}

output "sg_allow_all_from_internal" {
  value = "${aws_security_group.allow_all_from_internal.id}"
}

output "sg_allow_ssh" {
  value = "${aws_security_group.allow_ssh.id}"
}
