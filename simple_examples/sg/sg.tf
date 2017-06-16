provider "aws" {
  #access_key = "aaaaaaaaaaaaaaaaaaaaaa"
  #secret_key = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
  region     = "ap-southeast-1"
}

resource "aws_security_group" "allow_all" {
  name        = "terra-amit-sg"	#Group Name
  description = "Allow all inbound traffic"	#Group description
  vpc_id = "vpc-64139d00"	#your VPC ID
  #vpc_id     = "${aws_vpc.terra-amit-vpc.id}"
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
