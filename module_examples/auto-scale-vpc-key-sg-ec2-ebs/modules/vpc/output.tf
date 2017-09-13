output "vpc_id" {
  value = "${aws_vpc.project-igi-vpc.id}"
}

output "subnet_id" {
  value = "${aws_subnet.my-subnet.id}"
}
