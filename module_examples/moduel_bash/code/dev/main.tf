##Terraform v0.9.8
provider "aws" {
  region     = "${var.region}"
}


module "my-vpc-stage" {
  source = "/root/terraform-aws/dev/test4/code/dev/modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  subnet_cidr = "${var.subnet_cidr}"
  environment              = "${var.environment}"
}

