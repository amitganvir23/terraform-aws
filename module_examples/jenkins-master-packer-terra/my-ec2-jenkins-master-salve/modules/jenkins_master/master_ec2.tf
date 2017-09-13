
### ec2 instance
resource "aws_instance" "master_ec2" {
  availability_zone = "${var.zone}"
  ami           = "${var.master_ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = true
  #associate_public_ip_address = false
  source_dest_check = false
  count = "1"
  #security_groups = ["${var.sg_name}"]
  security_groups = ["${aws_security_group.sg_test.id}"]
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
    delete_on_termination = true
	}
 volume_tags = {
		Name = "amit-test2"
		}
  tags = {
	Name = "Test-machine-amit-${var.tagg_p1}"
	EC2 = "${var.tagg_p1}"
	}
}

resource "null_resource" "slave_node_add" {

provisioner "local-exec" {
      command = "sleep 3m && ansible-playbook ansible-code/jenkins-node/jenkins-slave.yml --private-key=/root/terra-amit-key -i /etc/ansible/ec2.py -e slave_ip=${var.slave_ip} "
}

}


