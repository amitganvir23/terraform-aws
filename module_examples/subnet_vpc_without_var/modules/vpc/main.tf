provider "aws" {
  #access_key = "AKIAILIFJ5DSZIU2F73A"
  #secret_key = "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"
  region     = "ap-southeast-1"
}


resource "aws_vpc" "terra-amit-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
	Name = "terra-amit-vpc"
	}
}

