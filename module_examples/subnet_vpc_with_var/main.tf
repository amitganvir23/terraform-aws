##Terraform v0.9.8
provider "aws" {
  region     = "${var.region}"
}

module "my-vpc" {
  source = "/root/terraform-aws/dev/test2/modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
}

module "my-subnet" {
  source = "/root/terraform-aws/dev/test2/modules/subnet"
  subnet_cidr = "${var.subnet_cidr}"
  vpc_id = "${module.my-vpc.vpc_id}"
}
