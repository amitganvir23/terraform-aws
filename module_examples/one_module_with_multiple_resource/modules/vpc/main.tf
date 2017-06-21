## creating New VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "${var.vpc_cidr}"
  tags = {
	Name = "${var.environment}-terra-amit-vpc"
	}
}

## creating new subnet using above vpcid
resource "aws_subnet" "my-subnet" {
  vpc_id     = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.subnet_cidr}"

  tags {
    Name = "${var.environment}-terra-amit-subnet"
  }
}

