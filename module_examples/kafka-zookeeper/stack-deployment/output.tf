output "private_subnet_ids_str" {
   value = "${module.kafka-vpc.aws_pri_subnet_id_str}"
}

output "private_subnet_ids" {
   value = "${module.kafka-vpc.aws_pri_subnet_id}"
}

output "publice_subnet_ids_str" {
   value = "${module.kafka-vpc.aws_pub_subnet_id_str}"
}

output "public_subnet_ids" {
   value = "${module.kafka-vpc.aws_pub_subnet_id}"
}
