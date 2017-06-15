provider "aws" {
  region     = "ap-southeast-1"
  #access_key = "aaaaaaaaaaaaaaaaaaaaaa"
  #secret_key = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
}

### VPC
resource "aws_vpc" "terra-amit-vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
        Name = "terra-amit-vpc"
        }
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.terra-amit-vpc.id}"
  availability_zone = "ap-southeast-1a"
  #vpc_id     = "vpc-64139d00"
  cidr_block = "10.10.2.0/24"

  tags {
    Name = "terra-amit-subnet"
  }
}

resource "aws_security_group" "sg_test" {
  name        = "terra-amit-sg"	#Group Name
  description = "Allow all inbound traffic"	#Group description
  vpc_id     = "${aws_vpc.terra-amit-vpc.id}"
  #vpc_id = "vpc-64139d00"	#your VPC ID
  #instance_tenancy = "dedicated"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.8.0.0/24"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/24"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.16.0.0/24"]
  }

   egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
   }

  tags {
    Name = "my-terra-amit-sg"
  }
}

