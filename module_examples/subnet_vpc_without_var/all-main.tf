provider "aws" {
  region     = "ap-southeast-1"
}

module "my_vpc" {
  source = "/root/terraform-aws/dev/test/modules/vpc"
}

module "my_vol" {
  source = "/root/terraform-aws/dev/test/modules/volume"
}
