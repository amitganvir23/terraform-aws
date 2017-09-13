## creating New VPC
resource "aws_vpc" "project-igi-vpc" {
  cidr_block = "${var.vpc_cidr}"
  tags = {
	Name = "${var.vpc_name}-${var.environment}-amit"
	}
}


/* Internet-Gateways */
resource "aws_internet_gateway" "igw" {
  vpc_id     = "${aws_vpc.project-igi-vpc.id}"
   tags = {
        Name         = "igw-pub-sub-amit"
   }
}


#### Routing information for public subnet
resource "aws_route_table" "pub_rtb" {
   vpc_id     = "${aws_vpc.project-igi-vpc.id}"
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id ="${aws_internet_gateway.igw.id}"
   }
   tags = {
     Name        = "Public-amit"
   }
}
resource "aws_route_table_association" "a-pub-sub" {
   subnet_id      = "${aws_subnet.my-subnet.id}"
   route_table_id = "${aws_route_table.pub_rtb.id}"
}

## creating new subnet using above vpcid
resource "aws_subnet" "my-subnet" {
  vpc_id     = "${aws_vpc.project-igi-vpc.id}"
  availability_zone = "${var.azs}"
  cidr_block = "${var.subnet_cidr}"

  tags {
    Name = "${var.environment}-terra-amit-subnet"
  }
}


resource "null_resource" "module_dependency" {
   depends_on = [
        "aws_vpc.project-igi-vpc",
	"aws_subnet.my-subnet",
	"aws_route_table.pub_rtb",
	"aws_route_table_association.a-pub-sub",
	"aws_internet_gateway.igw"
	]
}
