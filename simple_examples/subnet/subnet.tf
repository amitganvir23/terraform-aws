provider "aws" {
  #access_key = "aaaaaaaaaaaaaaaaaaaaaa"
  #secret_key = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
  region     = "ap-southeast-1"
}

resource "aws_subnet" "main" {
  vpc_id     = "vpc-64139d00"
  cidr_block = "10.10.2.0/24"
  #vpc_id     = "${aws_vpc.terra-amit-vpc.id}"
  #availability_zone = "ap-southeast-1a"

  tags {
    Name = "terra-amit-subnet"
  }
}
