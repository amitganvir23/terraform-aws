##Terraform v0.9.8
provider "aws" {
  region     = "${var.region}"
}

resource "aws_key_pair" "terra-amit-keypair" {
  key_name = "terra-amit-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD4Y80108e92JiHofnbStYc+CQVGlIMQtjMIPIctfBCSgHJdA/x82gfE6bB9zHsoMKVivR3GK3Lmf21ci/x4fH4hYDjUrDSyVJjt5U0sC339ZmEIOB/TKA01b6ATPza0flJadfhZ0m/PKf//7ryF9vcdQB0lNOLu25q9xaVY1ttVF2AdZNWoWDFh5l1fQyCYuRGo36+Z8PWqZKnVAZ6SZQ6JDeCl+6O8C/MlDLizRPETbg5PSsGy3PbAy6SV+IkdvYAIhSKkhVf221edhhIq8fKY/M2hiBRNIjwGaAvvIjBnX1a0T6RmMNCmgDvxMSa72gugEGi6/j0PD4n57wry3f9 root@amit-server"
}


######## vpc
module "my-vpc" {
  source = "/root/glp-task/NEW/my-ec2-launch-test/modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  subnet_cidr = "${var.subnet_cidr}"
  environment              = "${var.environment}"
  zone              = "${var.zone}"
}


########## ec2 and SG
module "my-server" {
  source 	    = "/root/glp-task/NEW/my-ec2-launch-test/modules/server1"
  subnet_id 	    = "${module.my-vpc.subnet_id}"
  vpc_id 	    = "${module.my-vpc.vpc_id}"
  environment       = "${var.environment}"
  my_ami            = "${var.my_ami}"
  zone              = "${var.zone}"
  key_name          = "${var.key_name}"
  tagg_p1      = "${var.tagg_p1}"
  tagg_p2      = "${var.tagg_p2}"
}

