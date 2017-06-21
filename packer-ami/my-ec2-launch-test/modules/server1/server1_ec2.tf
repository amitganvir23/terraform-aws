
### ec2 instance
resource "aws_instance" "my-ec2" {
  availability_zone = "${var.zone}"
  ami           = "${var.my_ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = true
  #associate_public_ip_address = false
  source_dest_check = false
  count = "1"
  security_groups = ["${aws_security_group.sg_test.id}"]
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
    delete_on_termination = true
	}
 volume_tags = {
		Name = "amit-test"
		}
  tags = {
	Name = "Test-machine-amit"
	couchbase = "server_vm1"
	}
}

