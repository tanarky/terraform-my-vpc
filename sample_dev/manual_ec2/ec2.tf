
resource "aws_instance" "sshgw" {
  instance_type = "t2.micro"
  ami = "ami-0f63c02167ca94956"

  subnet_id = "${data.terraform_remote_state.sample_dev.subnet_public_a}"
  vpc_security_group_ids = [
    "${data.terraform_remote_state.sample_dev.sg_allow_ssh}",
    "${data.terraform_remote_state.sample_dev.sg_allow_all_from_internal}",
  ]
  key_name = "${var.ec2_key_name}"
  tags = {
    Name = "${format("sshgw%02d", count.index)}"
  }
  count = 1
}
