output "slave_ip" {
  value = "${aws_instance.slave_ec2.private_ip}"
}
