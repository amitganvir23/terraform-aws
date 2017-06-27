provider "aws" {
  region     = "eu-west-1"
}

### VPC
resource "aws_vpc" "terra-amit-vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
        Name = "terra-amit-vpc"
        }
}


/* Internet-Gateways */
resource "aws_internet_gateway" "igw" {
   vpc_id = "${aws_vpc.terra-amit-vpc.id}"
   tags = {
        Name         = "igw-pub-sub-amit"
   }
}


#### Routing information for public subnet
resource "aws_route_table" "pub_rtb" {
   vpc_id = "${aws_vpc.terra-amit-vpc.id}"
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id ="${aws_internet_gateway.igw.id}"
   }
   tags = {
     Name        = "Public-RTB-amit"
   }
}
resource "aws_route_table_association" "a-pub-sub" {
#   count          =  "${length(var.public_sub_cidr)}"
   subnet_id      = "${aws_subnet.public-subnet.id}"
   route_table_id = "${aws_route_table.pub_rtb.id}"
}


###### public subnet
resource "aws_subnet" "public-subnet" {
#   count             = "${length(var.public_sub_cidr)}"
  vpc_id     = "${aws_vpc.terra-amit-vpc.id}"
  availability_zone = "eu-west-1a"
  cidr_block = "10.10.2.0/24"

  tags {
    Name = "terra-amit-subnet"
  }
}

#it will create New Elastic public IP for NAT for VPN's
/********************Nat-Gateway **********************/
resource "aws_nat_gateway" "ngw" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id     = "${aws_subnet.public-subnet.id}"
    depends_on    = ["aws_internet_gateway.igw"]
}

resource "aws_eip" "nat"{
   vpc = true
}
################# public subnet --- end

/********* Private-subnet ***************/

resource "aws_subnet" "private-subnet" {
#   count             = "${length(var.private_sub_cidr)}"
#   availability_zone = "${element(var.azs,count.index)}"
#   cidr_block        = "${var.private_sub_cidr[count.index]}"
    availability_zone = "eu-west-1a"
    cidr_block = "10.10.3.0/24"
    vpc_id     = "${aws_vpc.terra-amit-vpc.id}"
   tags = {
        Name        = "Private_Subnet-amit"
   }
   depends_on = ["aws_nat_gateway.ngw"]
}

/***** Routing information private subnet ************/

resource "aws_route_table" "pri_rtb" {
   vpc_id     = "${aws_vpc.terra-amit-vpc.id}"
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id ="${aws_nat_gateway.ngw.id}"
   }
   tags = {
     Name        = "Private-RTB-amit"
   }
}

resource "aws_route_table_association" "a-priv-sub" {
  # count          = "${length(var.private_sub_cidr)}"
  # subnet_id      =  "${element(aws_subnet.private-subnet.*.id,count.index)}"
  # route_table_id = "${element(aws_route_table.pri_rtb.*.id,count.index)}"
   subnet_id      = "${aws_subnet.public-subnet.id}"
   route_table_id = "${aws_route_table.pub_rtb.id}"
}

