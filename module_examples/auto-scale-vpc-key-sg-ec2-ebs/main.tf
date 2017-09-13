##Terraform v0.9.8
provider "aws" {
  region     = "${var.region}"
}

resource "aws_key_pair" "terra-amit-keypair" {
  key_name = "terra-amit-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD4Y80108e92JiHofnbStYc+CQVGlIMQtjMIPIctfBCSgHJdA/x82gfE6bB9zHsoMKVivR3GK3Lmf21ci/x4fH4hYDjUrDSyVJjt5U0sC339ZmEIOB/TKA01b6ATP root@amit-server"
}


######## vpc
module "project-igi-vpc" {
  source 		= "modules/vpc"
  azs              	= "${var.azs}"
  vpc_cidr 		= "${var.vpc_cidr}"
  subnet_cidr 		= "${var.subnet_cidr}"
  vpc_name              = "${var.vpc_name}"
  environment           = "${var.environment}"
}


########## ec2 and SG
module "my-server" {
  source 	    = "modules/server1"
  subnet_id 	    = "${module.project-igi-vpc.subnet_id}"
  vpc_id 	    = "${module.project-igi-vpc.vpc_id}"
  environment       = "${var.environment}"
  my_ami            = "${var.my_ami}"
  azs              	= "${var.azs}"
  key_name          = "${var.key_name}"
  tagg_p1      = "${var.tagg_p1}"
  tagg_p2      = "${var.tagg_p2}"
  disk_name            = "${var.disk_name}"
  mongo_ebs_vol_type            = "${var.mongo_ebs_vol_type}"
  mongo_ebs_vol_size            = "${var.mongo_ebs_vol_size}"
  mount_data_dir                = "${var.mount_data_dir}"
  mongo_master_asg_max_size     = "${var.mongo_master_asg_max_size}"
  asg_min_size     = "${var.asg_min_size}"
  mongo_master_asg_desired_size = "${var.mongo_master_asg_desired_size}"  
}
